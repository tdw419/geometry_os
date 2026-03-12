
import json
from PIL import Image
from pathlib import Path

def generate_vlm_test_image():
    # Paths
    assets_dir = Path("web/assets")
    atlas_path = assets_dir / "universal_font.rts.png"
    meta_path = assets_dir / "glyph_info.json"
    output_path = Path("vlm_test_program.png")

    if not atlas_path.exists() or not meta_path.exists():
        print("Error: Font atlas or metadata not found. Run atlas_gen.py first.")
        return

    # Load atlas and metadata
    atlas = Image.open(atlas_path)
    with open(meta_path, 'r') as f:
        meta = json.load(f)

    glyph_size = meta["glyph_size"]
    atlas_width = meta["atlas_size"]
    glyphs_per_row = atlas_width // glyph_size

    # Opcode sequence for the experiment: Alloc -> Store -> Loop -> Call -> Halt
    # Based on atlas_gen.py indices
    opcodes = [
        ("200", "Alloc"),
        ("203", "Store"),
        ("204", "Loop"),
        ("206", "Call"),
        ("215", "Halt")
    ]

    # Create output canvas
    spacing = 4
    canvas_width = (glyph_size + spacing) * len(opcodes)
    canvas_height = glyph_size + (spacing * 2)
    test_image = Image.new("RGBA", (canvas_width, canvas_height), (20, 20, 25, 255)) # Dark background

    for i, (idx, name) in enumerate(opcodes):
        code = int(idx)
        col = code % glyphs_per_row
        row = code // glyphs_per_row
        
        # Crop glyph from atlas
        left = col * glyph_size
        top = row * glyph_size
        glyph = atlas.crop((left, top, left + glyph_size, top + glyph_size))
        
        # Paste onto canvas
        dest_x = i * (glyph_size + spacing) + spacing
        dest_y = spacing
        test_image.paste(glyph, (dest_x, dest_y), glyph)

    # Scale up for better VLM visibility (4x)
    final_image = test_image.resize((canvas_width * 4, canvas_height * 4), Image.NEAREST)
    final_image.save(output_path)
    print(f"VLM Test Image generated: {output_path}")

if __name__ == "__main__":
    generate_vlm_test_image()
