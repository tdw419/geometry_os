# RTS AMP PyTorch Lightning Integration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Streamline RTS AMP training infrastructure with seamless PyTorch Lightning integration

**Architecture:** Create clean adapters between RTS AMP and PyTorch Lightning - unified config, automatic dtype handling, checkpoint management, and logging integration.

**Tech Stack:** PyTorch Lightning, PyTorch, RTS AMP

**Problem Context:**
- Current AMP and Lightning integration is partial
- Need unified configuration system
- Checkpoint compatibility between raw PyTorch and Lightning
- Logging/metrics integration
- Trainer lifecycle management

---

## Task 1: Create Unified AMP-Lightning Config

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_config.py`
- Read: `geometry_os/systems/pixel_compiler/amp_lightning_module.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_config.py`

**Step 1: Write the failing test**

```python
# tests/test_unified_config.py
import pytest
from dataclasses import asdict
from systems.pixel_compiler.amp_config import AmpConfig, LightningAmpConfig

def test_unified_config_from_dict():
    """Should create unified config from dictionary"""
    config_dict = {
        'enabled': True,
        'dtype': 'bfloat16',
        'learning_rate': 0.001,
        'max_epochs': 10,
        'gradient_clip_val': 1.0,
    }

    config = LightningAmpConfig.from_dict(config_dict)

    assert config.enabled == True
    assert str(config.dtype) == 'bfloat16' or config.dtype == torch.bfloat16
    assert config.learning_rate == 0.001
    assert config.max_epochs == 10
    assert config.gradient_clip_val == 1.0

def test_unified_config_auto_detection():
    """Should auto-detect optimal settings"""
    config = LightningAmpConfig.auto()

    assert config.enabled
    assert config.dtype in ['bfloat16', 'float16', 'float32']
    assert config.max_epochs > 0

def test_unified_config_to_lightning_kwargs():
    """Should convert to Lightning Trainer kwargs"""
    config = LightningAmpConfig.auto()

    kwargs = config.to_lightning_kwargs()

    assert 'precision' in kwargs
    assert 'max_epochs' in kwargs
    assert 'gradient_clip_val' in kwargs
    assert 'accelerator' in kwargs

def test_unified_config_with_checkpointing():
    """Should handle checkpoint configuration"""
    config = LightningAmpConfig(
        enabled=True,
        checkpoint_dir='./checkpoints',
        save_top_k=3,
        monitor='val_loss',
    )

    lightning_kwargs = config.to_lightning_kwargs()

    assert 'callbacks' in lightning_kwargs
    assert len(lightning_kwargs['callbacks']) > 0
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_unified_config.py -v`
Expected: FAIL with missing LightningAmpConfig

**Step 3: Write unified config implementation**

```python
# amp_config.py - add to existing file
import torch
from dataclasses import dataclass, field
from typing import Optional, Dict, Any, List
from pathlib import Path

@dataclass
class LightningAmpConfig:
    """Unified configuration for RTS AMP + PyTorch Lightning"""

    # AMP settings
    enabled: bool = True
    dtype: str = 'auto'  # 'auto', 'bfloat16', 'float16', 'float32'
    loss_scale: str = 'dynamic'  # 'dynamic', 'static', 'none'

    # Training settings
    learning_rate: float = 1e-3
    max_epochs: int = 100
    max_steps: int = -1  # -1 means use epochs
    gradient_clip_val: float = 0.0
    gradient_clip_algorithm: str = 'norm'  # 'norm' or 'value'
    accumulate_grad_batches: int = 1

    # Checkpointing
    checkpoint_dir: str = './checkpoints'
    save_top_k: int = 3
    monitor: str = 'val_loss'
    mode: str = 'min'  # 'min' or 'max'
    save_last: bool = True
    every_n_epochs: int = 1

    # Logging
    log_every_n_steps: int = 50
    logger_type: str = 'tensorboard'  # 'tensorboard', 'wandb', 'csv', 'none'

    # Hardware
    devices: int = -1  # -1 means use all available
    accelerator: str = 'auto'  # 'auto', 'cuda', 'cpu', 'mps'
    precision: str = 'auto'  # Auto-detected from dtype

    # Performance
    gradient_checkpointing: bool = False
    compile_model: bool = False  # PyTorch 2.0+ compile
    detect_anomaly: bool = False

    # Reproducibility
    seed: int = 42
    deterministic: bool = False

    def __post_init__(self):
        """Post-initialization processing"""
        # Resolve auto dtype
        if self.dtype == 'auto':
            from .amp_bf16_utils import get_optimal_dtype
            optimal = get_optimal_dtype()
            dtype_map = {
                torch.bfloat16: 'bfloat16',
                torch.float16: 'float16',
                torch.float32: 'float32',
            }
            self.dtype = dtype_map.get(optimal, 'float32')

        # Resolve precision for Lightning
        if self.precision == 'auto':
            precision_map = {
                'bfloat16': 'bf16',
                'float16': '16',
                'float32': '32-true',
            }
            self.precision = precision_map.get(self.dtype, '32-true')

        # Create checkpoint directory
        Path(self.checkpoint_dir).mkdir(parents=True, exist_ok=True)

    @classmethod
    def auto(cls) -> 'LightningAmpConfig':
        """Create config with auto-detected optimal settings"""
        return cls(
            enabled=True,
            dtype='auto',
            precision='auto',
            devices=-1,
            accelerator='auto',
        )

    @classmethod
    def from_dict(cls, config_dict: Dict[str, Any]) -> 'LightningAmpConfig':
        """Create config from dictionary"""
        # Filter out None values
        filtered = {k: v for k, v in config_dict.items() if v is not None}
        return cls(**filtered)

    def to_lightning_kwargs(self) -> Dict[str, Any]:
        """Convert to PyTorch Lightning Trainer kwargs"""
        from lightning.pytorch.callbacks import ModelCheckpoint
        from lightning.pytorch.loggers import TensorBoardLogger

        callbacks = []

        # Add checkpoint callback
        checkpoint_callback = ModelCheckpoint(
            dirpath=self.checkpoint_dir,
            filename=f"model-{{epoch:02d}}-{{{self.monitor}:.2f}}",
            monitor=self.monitor,
            save_top_k=self.save_top_k,
            mode=self.mode,
            save_last=self.save_last,
            every_n_epochs=self.every_n_epochs,
        )
        callbacks.append(checkpoint_callback)

        # Configure logger
        logger = None
        if self.logger_type != 'none':
            if self.logger_type == 'tensorboard':
                logger = TensorBoardLogger(
                    save_dir='./logs',
                    name='lightning_logs',
                )
            # Add other logger types as needed

        return {
            'max_epochs': self.max_epochs,
            'max_steps': self.max_steps if self.max_steps > 0 else None,
            'gradient_clip_val': self.gradient_clip_val if self.gradient_clip_val > 0 else None,
            'gradient_clip_algorithm': self.gradient_clip_algorithm,
            'accumulate_grad_batches': self.accumulate_grad_batches,
            'precision': self.precision,
            'accelerator': self.accelerator,
            'devices': self.devices,
            'callbacks': callbacks,
            'logger': logger,
            'log_every_n_steps': self.log_every_n_steps,
            'deterministic': self.deterministic,
            'enable_checkpointing': True,
        }

    def get_dtype(self) -> torch.dtype:
        """Get PyTorch dtype from string"""
        dtype_map = {
            'bfloat16': torch.bfloat16,
            'float16': torch.float16,
            'float32': torch.float32,
        }
        return dtype_map.get(self.dtype, torch.float32)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization"""
        return asdict(self)

    def save(self, path: str):
        """Save config to JSON file"""
        import json
        with open(path, 'w') as f:
            json.dump(self.to_dict(), f, indent=2)

    @classmethod
    def load(cls, path: str) -> 'LightningAmpConfig':
        """Load config from JSON file"""
        import json
        with open(path, 'r') as f:
            config_dict = json.load(f)
        return cls.from_dict(config_dict)
```

**Step 4: Run tests**

Run: `python -m pytest tests/test_unified_config.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_config.py
git add tests/test_unified_config.py
git commit -m "feat: add unified AMP-Lightning configuration"
```

---

## Task 2: Create Seamless Lightning Trainer Wrapper

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_trainer.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_trainer.py`

**Step 1: Write the failing test**

```python
# tests/test_lightning_trainer_wrapper.py
import pytest
import torch
from lightning.pytorch import LightningModule
from systems.pixel_compiler.amp_trainer import RtsLightningTrainer
from systems.pixel_compiler.amp_config import LightningAmpConfig

class DummyLightningModule(LightningModule):
    def __init__(self):
        super().__init__()
        self.layer = torch.nn.Linear(10, 5)

    def forward(self, x):
        return self.layer(x)

    def training_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = torch.nn.functional.mse_loss(y_hat, y)
        return loss

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters())

def test_trainer_creation_with_config():
    """Should create trainer with unified config"""
    config = LightningAmpConfig.auto()

    trainer = RtsLightningTrainer(
        config=config,
    )

    assert trainer is not None
    assert trainer.config == config

def test_trainer_fit_with_dummy_data():
    """Should train with dummy data"""
    config = LightningAmpConfig(
        max_epochs=2,
        log_every_n_steps=1,
    )

    model = DummyLightningModule()

    # Create dummy data
    train_data = [(torch.randn(10), torch.randn(5)) for _ in range(10)]
    val_data = [(torch.randn(10), torch.randn(5)) for _ in range(3)]

    trainer = RtsLightningTrainer(config=config)

    # Create data loaders
    from torch.utils.data import DataLoader, TensorDataset
    train_dataset = TensorDataset(
        torch.stack([x for x, _ in train_data]),
        torch.stack([y for _, y in train_data])
    )
    val_dataset = TensorDataset(
        torch.stack([x for x, _ in val_data]),
        torch.stack([y for _, y in val_data])
    )
    train_loader = DataLoader(train_dataset, batch_size=2)
    val_loader = DataLoader(val_dataset, batch_size=2)

    # This should not crash
    try:
        trainer.fit(model, train_loader, val_loader)
        success = True
    except Exception as e:
        print(f"Training failed: {e}")
        success = False

    assert success, "Training should complete without errors"

def test_trainer_checkpoint_resume():
    """Should save and resume from checkpoint"""
    import tempfile
    import os

    with tempfile.TemporaryDirectory() as tmpdir:
        config = LightningAmpConfig(
            max_epochs=1,
            checkpoint_dir=tmpdir,
            save_top_k=1,
        )

        model = DummyLightningModule()
        trainer = RtsLightningTrainer(config=config)

        # Create dummy data
        train_dataset = torch.utils.data.TensorDataset(
            torch.randn(10, 10),
            torch.randn(10, 5)
        )
        train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=2)

        # Train and save checkpoint
        trainer.fit(model, train_loader)

        # Find checkpoint file
        ckpt_files = [f for f in os.listdir(tmpdir) if f.endswith('.ckpt')]
        assert len(ckpt_files) > 0, "Should have saved checkpoint"

        # Resume training
        ckpt_path = os.path.join(tmpdir, ckpt_files[0])
        trainer2 = RtsLightningTrainer(config=config)
        trainer2.fit(model, train_loader, ckpt_path=ckpt_path)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_lightning_trainer_wrapper.py -v`
Expected: FAIL with missing RtsLightningTrainer

**Step 3: Read existing trainer**

Run: Read `geometry_os/systems/pixel_compiler/amp_trainer.py`

**Step 4: Write wrapper implementation**

```python
# amp_trainer.py - add seamless wrapper
from lightning.pytorch import Trainer
from lightning.pytorch.callbacks import Callback
from typing import Optional, Any, Dict, List
import logging

logger = logging.getLogger(__name__)

class RtsLightningTrainer:
    """
    Seamless wrapper for PyTorch Lightning with RTS AMP integration.
    """

    def __init__(
        self,
        config: Optional[LightningAmpConfig] = None,
        **kwargs
    ):
        if config is None:
            config = LightningAmpConfig.auto()

        self.config = config

        # Print configuration
        self._print_config()

        # Get Lightning kwargs
        lightning_kwargs = config.to_lightning_kwargs()

        # Override with any explicit kwargs
        lightning_kwargs.update(kwargs)

        # Create Lightning Trainer
        self.trainer = Trainer(**lightning_kwargs)

        self._is_fitted = False

    def _print_config(self):
        """Print configuration summary"""
        from .amp_bf16_utils import print_bf16_status

        print("\n" + "="*60)
        print("RTS Lightning Trainer Configuration")
        print("="*60)
        print(f"Enabled: {self.config.enabled}")
        print(f"Precision: {self.config.precision}")
        print(f"Max Epochs: {self.config.max_epochs}")
        print(f"Gradient Clip Val: {self.config.gradient_clip_val}")
        print(f"Accumulate Grad Batches: {self.config.accumulate_grad_batches}")
        print(f"Checkpoint Dir: {self.config.checkpoint_dir}")
        print("="*60)

        print_bf16_status()

    def fit(
        self,
        model: LightningModule,
        train_dataloader=None,
        val_dataloader=None,
        datamodule=None,
        ckpt_path: Optional[str] = None,
    ):
        """Train the model"""
        logger.info("Starting training...")

        result = self.trainer.fit(
            model,
            train_dataloaders=train_dataloader,
            val_dataloaders=val_dataloader,
            datamodule=datamodule,
            ckpt_path=ckpt_path,
        )

        self._is_fitted = True
        return result

    def validate(self, model=None, dataloaders=None, ckpt_path=None):
        """Run validation"""
        return self.trainer.validate(
            model=model,
            dataloaders=dataloaders,
            ckpt_path=ckpt_path,
        )

    def test(self, model=None, dataloaders=None, ckpt_path=None):
        """Run testing"""
        return self.trainer.test(
            model=model,
            dataloaders=dataloaders,
            ckpt_path=ckpt_path,
        )

    def predict(self, model=None, dataloaders=None, ckpt_path=None):
        """Run prediction"""
        return self.trainer.predict(
            model=model,
            dataloaders=dataloaders,
            ckpt_path=ckpt_path,
        )

    def save_checkpoint(self, filepath: str, model: LightningModule):
        """Save model checkpoint"""
        self.trainer.save_checkpoint(filepath)
        logger.info(f"Checkpoint saved to {filepath}")

    def load_checkpoint(self, filepath: str, model: LightningModule):
        """Load model checkpoint"""
        ckpt = torch.load(filepath)
        model.load_state_dict(ckpt['state_dict'])
        logger.info(f"Checkpoint loaded from {filepath}")

    @property
    def logged_metrics(self) -> Dict[str, float]:
        """Get logged metrics"""
        return self.trainer.logged_metrics

    @property
    def callback_metrics(self) -> Dict[str, float]:
        """Get callback metrics"""
        return self.trainer.callback_metrics

    def tune(
        self,
        model: LightningModule,
        train_dataloader=None,
        val_dataloader=None,
        datamodule=None,
    ):
        """Run hyperparameter tuning"""
        return self.trainer.tune(
            model,
            train_dataloaders=train_dataloader,
            val_dataloaders=val_dataloader,
            datamodule=datamodule,
        )
```

**Step 5: Run tests**

Run: `python -m pytest tests/test_lightning_trainer_wrapper.py -v`
Expected: PASS

**Step 6: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_trainer.py
git add tests/test_lightning_trainer_wrapper.py
git commit -m "feat: add seamless Lightning trainer wrapper"
```

---

## Task 3: Update Lightning Module for AMP Integration

**Files:**
- Read: `geometry_os/systems/pixel_compiler/amp_lightning_module.py`
- Modify: `geometry_os/systems/pixel_compiler/amp_lightning_module.py`

**Step 1: Write the failing test**

```python
# tests/test_amp_lightning_integration.py
import pytest
import torch
from lightning.pytorch import LightningModule
from systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule
from systems.pixel_compiler.amp_config import LightningAmpConfig

class SimpleModel(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = torch.nn.Sequential(
            torch.nn.Linear(10, 20),
            torch.nn.ReLU(),
            torch.nn.Linear(20, 5),
        )

    def forward(self, x):
        return self.layers(x)

def test_lightning_module_with_unified_config():
    """Should work with unified config"""
    model = SimpleModel()
    config = LightningAmpConfig.auto()

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config,
    )

    assert lightning_module is not None
    assert lightning_module.model is model

def test_lightning_module_training_step():
    """Training step should work"""
    model = SimpleModel()
    config = LightningAmpConfig(
        learning_rate=0.001,
    )

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config,
    )

    # Simulate training step
    batch = (torch.randn(4, 10), torch.randn(4, 5))
    loss = lightning_module.training_step(batch, 0)

    assert loss is not None
    assert loss.item() > 0  # MSE loss should be positive

def test_lightning_module_configure_optimizers():
    """Should configure optimizer with AMP settings"""
    model = SimpleModel()
    config = LightningAmpConfig(
        learning_rate=0.001,
    )

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config,
    )

    optimizer = lightning_module.configure_optimizers()

    assert optimizer is not None
    assert isinstance(optimizer, torch.optim.Optimizer)
```

**Step 2: Run test to verify it fails**

Run: `python -m pytest tests/test_amp_lightning_integration.py -v`
Expected: FAIL with missing implementations

**Step 3: Update Lightning module**

```python
# amp_lightning_module.py - add unified config support
from .amp_config import LightningAmpConfig

class RtsAmpLightningModule(LightningModule):
    """
    Lightning module with RTS AMP integration.
    """

    def __init__(
        self,
        model: torch.nn.Module,
        config: Optional[LightningAmpConfig] = None,
        **kwargs
    ):
        super().__init__(**kwargs)

        if config is None:
            config = LightningAmpConfig.auto()

        self.model = model
        self.config = config

        # Set precision
        self.automatic_optimization = True

        # Save hyperparameters
        self.save_hyperparameters({
            'learning_rate': config.learning_rate,
            'dtype': config.dtype,
            'max_epochs': config.max_epochs,
        })

    def forward(self, *args, **kwargs):
        return self.model(*args, **kwargs)

    def training_step(self, batch, batch_idx):
        """Override in subclass"""
        raise NotImplementedError("Subclasses must implement training_step")

    def validation_step(self, batch, batch_idx):
        """Override in subclass"""
        raise NotImplementedError("Subclasses must implement validation_step")

    def configure_optimizers(self):
        """Configure optimizer with AMP considerations"""
        # Get learning rate
        lr = self.config.learning_rate

        # Adjust for dtype
        if self.config.dtype == 'bfloat16':
            # BF16 is more stable, can be more aggressive
            lr = lr * 1.5

        return torch.optim.AdamW(
            self.parameters(),
            lr=lr,
            betas=(0.9, 0.999),
            eps=1e-8 if self.config.dtype == 'bfloat16' else 1e-4,
            weight_decay=0.01,
        )

    def on_train_start(self) -> None:
        """Called at start of training"""
        super().on_train_start()

        # Log config info
        self.log('config/dtype', self.config.dtype)
        self.log('config/learning_rate', self.config.learning_rate)
        self.log('config/gradient_clip', self.config.gradient_clip_val)

    def on_train_epoch_end(self) -> None:
        """Called at end of training epoch"""
        super().on_train_epoch_end()

        # Log learning rate
        if self.trainer.optimizers:
            opt = self.trainer.optimizers[0]
            for i, group in enumerate(opt.param_groups):
                self.log(f'lr/group_{i}', group['lr'])
```

**Step 4: Run tests**

Run: `python -m pytest tests/test_amp_lightning_integration.py -v`
Expected: PASS

**Step 5: Commit**

```bash
git add geometry_os/systems/pixel_compiler/amp_lightning_module.py
git add tests/test_amp_lightning_integration.py
git commit -m "feat: update Lightning module for unified config"
```

---

## Task 4: Create Example Training Script

**Files:**
- Create: `geometry_os/systems/pixel_compiler/examples/train_with_lightning.py`

**Step 1: Create example script**

```python
#!/usr/bin/env python3
"""
Example training script using RTS AMP with PyTorch Lightning.
"""
import torch
from torch.utils.data import TensorDataset, DataLoader
from lightning.pytorch import LightningModule
from systems.pixel_compiler.amp_config import LightningAmpConfig
from systems.pixel_compiler.amp_trainer import RtsLightningTrainer
from systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule

class ExampleModel(torch.nn.Module):
    """Simple example model"""

    def __init__(self, input_dim=10, hidden_dim=64, output_dim=5):
        super().__init__()
        self.network = torch.nn.Sequential(
            torch.nn.Linear(input_dim, hidden_dim),
            torch.nn.ReLU(),
            torch.nn.Dropout(0.1),
            torch.nn.Linear(hidden_dim, hidden_dim),
            torch.nn.ReLU(),
            torch.nn.Dropout(0.1),
            torch.nn.Linear(hidden_dim, output_dim),
        )

    def forward(self, x):
        return self.network(x)

class ExampleLightningModule(RtsAmpLightningModule):
    """Example Lightning module"""

    def __init__(self, model, config):
        super().__init__(model, config)
        self.loss_fn = torch.nn.MSELoss()

    def training_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = self.loss_fn(y_hat, y)

        # Log metrics
        self.log('train_loss', loss, prog_bar=True)

        return loss

    def validation_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = self.loss_fn(y_hat, y)

        self.log('val_loss', loss, prog_bar=True)

        return loss

def create_dummy_data(n_samples=1000, input_dim=10, output_dim=5):
    """Create dummy training data"""
    x = torch.randn(n_samples, input_dim)
    y = torch.randn(n_samples, output_dim)

    return x, y

def main():
    """Main training function"""
    print("="*60)
    print("RTS AMP + PyTorch Lightning Example")
    print("="*60)

    # Create configuration
    config = LightningAmpConfig(
        enabled=True,
        dtype='auto',  # Auto-detect BF16/FP16/FP32
        learning_rate=1e-3,
        max_epochs=10,
        gradient_clip_val=1.0,
        checkpoint_dir='./checkpoints/example',
        log_every_n_steps=10,
    )

    # Create model
    model = ExampleModel()
    lightning_module = ExampleLightningModule(model, config)

    # Create data
    x_train, y_train = create_dummy_data(n_samples=1000)
    x_val, y_val = create_dummy_data(n_samples=200)

    train_dataset = TensorDataset(x_train, y_train)
    val_dataset = TensorDataset(x_val, y_val)

    train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
    val_loader = DataLoader(val_dataset, batch_size=32)

    # Create trainer
    trainer = RtsLightningTrainer(config=config)

    # Train
    print("\nStarting training...")
    trainer.fit(lightning_module, train_loader, val_loader)

    # Test
    print("\nRunning validation...")
    val_results = trainer.validate(lightning_module, val_loader)
    print(f"Validation results: {val_results}")

    print("\nTraining complete!")
    print(f"Checkpoints saved to: {config.checkpoint_dir}")

if __name__ == '__main__':
    main()
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/examples/train_with_lightning.py
git commit -m "docs: add Lightning training example"
```

---

## Task 5: Documentation

**Files:**
- Create: `geometry_os/systems/pixel_compiler/LIGHTNING_GUIDE.md`

**Step 1: Create documentation**

```markdown
# PyTorch Lightning Integration Guide

## Overview

RTS AMP provides seamless integration with PyTorch Lightning for streamlined training workflows.

## Quick Start

### Basic Usage

```python
from systems.pixel_compiler.amp_config import LightningAmpConfig
from systems.pixel_compiler.amp_trainer import RtsLightningTrainer
from systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule

# Create config with auto-detection
config = LightningAmpConfig.auto()

# Create trainer
trainer = RtsLightningTrainer(config=config)

# Train
trainer.fit(model, train_loader, val_loader)
```

### Full Example

See `examples/train_with_lightning.py` for a complete example.

## Configuration

### Auto-Detection (Recommended)

```python
config = LightningAmpConfig.auto()
```

This automatically detects:
- GPU capabilities (BF16/FP16/FP32)
- Number of available devices
- Optimal precision settings

### Manual Configuration

```python
config = LightningAmpConfig(
    dtype='bfloat16',  # or 'float16', 'float32'
    learning_rate=1e-3,
    max_epochs=100,
    gradient_clip_val=1.0,
    checkpoint_dir='./checkpoints',
)
```

### From Dictionary

```python
config = LightningAmpConfig.from_dict({
    'dtype': 'bfloat16',
    'max_epochs': 50,
    'learning_rate': 0.001,
})
```

### Save/Load Config

```python
config.save('config.json')
loaded_config = LightningAmpConfig.load('config.json')
```

## Training

### Basic Training

```python
trainer = RtsLightningTrainer(config=config)
trainer.fit(model, train_loader, val_loader)
```

### Resume from Checkpoint

```python
trainer.fit(model, train_loader, val_loader, ckpt_path='path/to/checkpoint.ckpt')
```

### Hyperparameter Tuning

```python
trainer.tune(model, train_loader, val_loader)
```

## Checkpointing

Checkpoints are automatically saved based on validation metrics. Configure with:

```python
config = LightningAmpConfig(
    checkpoint_dir='./checkpoints',
    monitor='val_loss',
    mode='min',
    save_top_k=3,
)
```

### Manual Checkpoint

```python
trainer.save_checkpoint('custom.ckpt', model)
```

### Load Checkpoint

```python
trainer.load_checkpoint('checkpoint.ckpt', model)
```

## Logging

Metrics are automatically logged. Configure logger type:

```python
config = LightningAmpConfig(
    logger_type='tensorboard',  # or 'wandb', 'csv', 'none'
    log_every_n_steps=50,
)
```

### Access Logged Metrics

```python
metrics = trainer.logged_metrics
print(metrics)
```

## Tips

1. **Use Auto-Detection**: Let RTS AMP pick optimal settings
2. **Gradient Accumulation**: For larger effective batch sizes
   ```python
   config = LightningAmpConfig(accumulate_grad_batches=4)
   ```
3. **Gradient Clipping**: Prevent exploding gradients
   ```python
   config = LightningAmpConfig(gradient_clip_val=1.0)
   ```

## Troubleshooting

**"Out of memory"**
- Reduce batch size
- Enable gradient checkpointing: `config.gradient_checkpointing = True`
- Use gradient accumulation

**"NaN loss"**
- Check learning rate
- Enable gradient clipping
- Consider switching to BF16 if using FP16
```

**Step 2: Commit**

```bash
git add geometry_os/systems/pixel_compiler/LIGHTNING_GUIDE.md
git commit -m "docs: add Lightning integration guide"
```

---

## Verification Steps

After completing all tasks:

1. **Run all tests:**
   ```bash
   python -m pytest tests/test_unified_config.py -v
   python -m pytest tests/test_lightning_trainer_wrapper.py -v
   python -m pytest tests/test_amp_lightning_integration.py -v
   ```

2. **Run example:**
   ```bash
   python systems/pixel_compiler/examples/train_with_lightning.py
   ```

3. **Verify checkpointing:**
   - Check that checkpoints are saved
   - Test resume from checkpoint

4. **Test with actual model:**
   - Use your own model with the integration
   - Verify training runs successfully

---

**Total Estimated Time:** 1-2 hours

**Dependencies:** None (can be done in parallel with other Phase 1 tasks)
