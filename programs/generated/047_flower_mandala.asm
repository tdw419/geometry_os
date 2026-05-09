; 047_flower_mandala.asm -- Geometric flower mandala with overlapping circles
; Central flower pattern with petal circles and decorative rings

; Dark purple background
LDI r0, 0x0D0020
FILL r0

; Outer ring - 6 large petal circles around center (128,128) at radius 60
; Petal 1: top
LDI r0, 128
LDI r1, 68
LDI r2, 45
LDI r3, 0xFF4488
CIRCLE r0, r1, r2, r3

; Petal 2: top-right (60 deg)
LDI r0, 180
LDI r1, 98
LDI r2, 45
LDI r3, 0xFF6644
CIRCLE r0, r1, r2, r3

; Petal 3: bottom-right (120 deg)
LDI r0, 180
LDI r1, 158
LDI r2, 45
LDI r3, 0xFFAA22
CIRCLE r0, r1, r2, r3

; Petal 4: bottom (180 deg)
LDI r0, 128
LDI r1, 188
LDI r2, 45
LDI r3, 0x44FF88
CIRCLE r0, r1, r2, r3

; Petal 5: bottom-left (240 deg)
LDI r0, 76
LDI r1, 158
LDI r2, 45
LDI r3, 0x4488FF
CIRCLE r0, r1, r2, r3

; Petal 6: top-left (300 deg)
LDI r0, 76
LDI r1, 98
LDI r2, 45
LDI r3, 0xAA44FF
CIRCLE r0, r1, r2, r3

; Inner ring - 6 smaller petal circles at radius 30, offset 30 degrees
LDI r0, 154
LDI r1, 83
LDI r2, 30
LDI r3, 0xFF88BB
CIRCLE r0, r1, r2, r3

LDI r0, 154
LDI r1, 173
LDI r2, 30
LDI r3, 0xFFCC66
CIRCLE r0, r1, r2, r3

LDI r0, 102
LDI r1, 173
LDI r2, 30
LDI r3, 0x88FFAA
CIRCLE r0, r1, r2, r3

LDI r0, 102
LDI r1, 83
LDI r2, 30
LDI r3, 0x88BBFF
CIRCLE r0, r1, r2, r3

LDI r0, 128
LDI r1, 55
LDI r2, 30
LDI r3, 0xCC88FF
CIRCLE r0, r1, r2, r3

LDI r0, 128
LDI r1, 201
LDI r2, 30
LDI r3, 0xFF8844
CIRCLE r0, r1, r2, r3

; Concentric rings at center
LDI r0, 128
LDI r1, 128
LDI r2, 22
LDI r3, 0xFFD700
CIRCLE r0, r1, r2, r3

LDI r0, 128
LDI r1, 128
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

LDI r0, 128
LDI r1, 128
LDI r2, 6
LDI r3, 0xFF3366
CIRCLE r0, r1, r2, r3

; Outer decorative circle outline
LDI r0, 128
LDI r1, 128
LDI r2, 110
LDI r3, 0x6644AA
CIRCLE r0, r1, r2, r3

LDI r0, 128
LDI r1, 128
LDI r2, 115
LDI r3, 0x332266
CIRCLE r0, r1, r2, r3

HALT
