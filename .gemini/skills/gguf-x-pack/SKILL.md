---
name: gguf-x-pack
description: Pack GGUF models into self-contained executable containers with embedded runtime and security signing
category: development
---

# GGUF-X Pack

Create self-contained executable models from GGUF weights with embedded Python runtime.

## When to Use

- Distributing LLM models as standalone executables
- Creating portable AI applications without dependencies
- Securing model distribution with cryptographic signing
- Bundling model + runtime for deployment

## Procedure

### Step 1: Prepare Inputs

```bash
# Required files:
# - model.gguf     : The quantized model weights
# - runtime.py     : Python application to run
# - entrypoint     : Function to call (default: main)
```

### Step 2: Generate Signing Keys (Optional)

```bash
cd systems/gguf_x
python3 cli.py keygen --name mykey

# Creates:
# - mykey.pem  (private - KEEP SECURE)
# - mykey.pub  (public - for verification)
```

### Step 3: Pack the Executable

```bash
python3 cli.py create \
    --source model.gguf \
    --runtime runtime.py \
    --output model.ggufx \
    --entrypoint main \
    --capabilities network,filesystem \
    --sign-key mykey.pem
```

### Step 4: Run the Executable

```bash
# Run with default settings
python3 cli.py run model.ggufx

# Run with trusted key verification
python3 cli.py run model.ggufx --trust-key mykey.pub
```

## CLI Reference

### create - Pack executable

```
usage: cli.py create [-h] --source SOURCE --runtime RUNTIME --output OUTPUT
                     [--entrypoint ENTRYPOINT] [--capabilities CAPS]
                     [--sign-key KEY] [--add-dummy-weights]

required:
  --source SOURCE      Input GGUF model file
  --runtime RUNTIME    Python runtime to embed
  --output OUTPUT      Output .ggufx file

optional:
  --entrypoint ENTRY   Function to call (default: main)
  --capabilities CAPS  Comma-separated: network,filesystem,gpu
  --sign-key KEY       Ed25519 private key for signing
  --add-dummy-weights  Add test weights for debugging
```

### run - Execute container

```
usage: cli.py run [-h] PATH [--trust-key KEY]

positional:
  PATH                 .ggufx executable to run

optional:
  --trust-key KEY      Public key for signature verification
```

### keygen - Generate keys

```
usage: cli.py keygen [-h] --name NAME

optional:
  --name NAME          Base name for key files (name.pem, name.pub)
```

## Troubleshooting

### "cryptography library not found"

**Cause**: Missing dependency for signing.
**Fix**: Install cryptography package.

```bash
pip install cryptography
```

### "Runtime extraction failed"

**Cause**: Corrupt container or missing runtime.
**Fix**: Re-pack with valid runtime file.

```bash
# Verify runtime syntax
python3 -m py_compile runtime.py

# Re-pack
python3 cli.py create --source model.gguf --runtime runtime.py --output fixed.ggufx
```

### "Signature verification failed"

**Cause**: Wrong public key or tampered container.
**Fix**: Verify key pair matches.

```bash
# Check keys match
openssl pkey -in mykey.pem -pubout | diff - mykey.pub

# If mismatch, regenerate and re-sign
python3 cli.py keygen --name newkey
python3 cli.py create --source model.gguf --runtime runtime.py --output model.ggufx --sign-key newkey.pem
```

### "Capability denied: network"

**Cause**: Executable not granted network capability.
**Fix**: Re-pack with capability flag.

```bash
python3 cli.py create --source model.gguf --runtime runtime.py --output model.ggufx --capabilities network
```

## Examples

### Pack LLaMA Model

```bash
# Download model
wget https://huggingface.co/.../llama-7b-q4.gguf

# Create runtime
cat > chat.py << 'EOF'
def main():
    from gguf_x import load_model
    model = load_model()
    while True:
        prompt = input("> ")
        print(model.generate(prompt))
EOF

# Pack
python3 cli.py create \
    --source llama-7b-q4.gguf \
    --runtime chat.py \
    --output llama-chat.ggufx \
    --capabilities network

# Run
python3 cli.py run llama-chat.ggufx
```

### Secure Distribution

```bash
# Generate keys
python3 cli.py keygen --name release-key

# Pack with signing
python3 cli.py create \
    --source model.gguf \
    --runtime app.py \
    --output secure-app.ggufx \
    --sign-key release-key.pem

# Distribute: send .ggufx + .pub to users
# Users verify:
python3 cli.py run secure-app.ggufx --trust-key release-key.pub
```

## Related Skills

- `pixelrts-convert` - Convert GGUF to spatial format
- `memory-system-setup` - Set up vector memory for embeddings
