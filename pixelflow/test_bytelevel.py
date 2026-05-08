from tokenizers import Tokenizer, models, trainers, pre_tokenizers, decoders

def test():
    # Setup a byte-level BPE tokenizer
    tokenizer = Tokenizer(models.BPE())
    tokenizer.pre_tokenizer = pre_tokenizers.ByteLevel(add_prefix_space=False)
    tokenizer.decoder = decoders.ByteLevel()
    
    # Simple training data
    data = ["; Draws a red circle", "LDI r1, 10", "loop:", "PSET r1, r2, 0xFF0000"]
    
    trainer = trainers.BpeTrainer(vocab_size=1000, special_tokens=["<PAD>", "<BOS>", "<EOS>"])
    tokenizer.train_from_iterator(data, trainer)
    
    # Test
    test_str = "; Draws a red circle"
    encoded = tokenizer.encode(test_str)
    print(f"IDs: {encoded.ids}")
    print(f"Tokens: {encoded.tokens}")
    decoded = tokenizer.decode(encoded.ids)
    print(f"Decoded: '{decoded}'")
    
    # Test individual tokens
    for tid in encoded.ids:
        print(f"ID {tid} -> '{tokenizer.decode([tid])}'")
    
    if decoded == test_str:
        print("Success: Perfect round-trip with ByteLevel")
    else:
        print(f"Failure: '{decoded}' != '{test_str}'")

if __name__ == "__main__":
    test()
