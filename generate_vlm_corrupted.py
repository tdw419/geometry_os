
import json
from PIL import Image, ImageDraw
from pathlib import Path

def generate_corrupted_vlm_image():
    assets_dir = Path("web/assets")
    atlas_path = assets_dir / "universal_font.rts.png"
    meta_path = assets_dir / "glyph_info.json"
    output_path = Path("vlm_test_corrupted.png")

    if not atlas_path.exists() or not meta_path.exists():
        return

    atlas = Image.open(atlas_path)
    with open(meta_path, 'r') as f:
        meta = json.load(f)

    glyph_size = meta["glyph_size"]
    atlas_width = meta["atlas_size"]
    glyphs_per_row = atlas_width // glyph_size

    opcodes = [
        ("200", "Alloc"),
        ("203", "Store"),
        ("204", "Loop"),
        ("206", "Call"),
        ("215", "Halt")
    ]

    spacing = 4
    canvas_width = (glyph_size + spacing) * len(opcodes)
    canvas_height = glyph_size + (spacing * 2)
    test_image = Image.new("RGBA", (canvas_width, canvas_height), (20, 20, 25, 255))

    for i, (idx, name) in enumerate(opcodes):
        code = int(idx)
        col = code % glyphs_per_row
        row = code // glyphs_per_row
        
        glyph = atlas.crop((col * glyph_size, row * glyph_size, (col + 1) * glyph_size, (row + 1) * glyph_size))
        
        # Apply visual corruption to specific glyphs
        if name == "Alloc":
            # "Al_oc" - Black out the 'l'
            draw = ImageDraw.Draw(glyph)
            draw.rectangle([6, 4, 8, 12], fill=(0, 0, 0, 0)) 
        elif name == "Store":
            # "Sto■e" - Put a block over the 'r'
            draw = ImageDraw.Draw(glyph)
            draw.rectangle([10, 6, 13, 10], fill=(255, 255, 255, 255))
        
        dest_x = i * (glyph_size + spacing) + spacing
        dest_y = spacing
        test_image.paste(glyph, (dest_x, dest_y), glyph)

    final_image = test_image.resize((canvas_width * 4, canvas_height * 4), Image.NEAREST)
    final_image.save(output_path)
    print(f"Corrupted VLM Test Image generated: {output_path}")

if __name__ == "__main__":
    generate_corrupted_vlm_image()
