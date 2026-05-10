; DESCRIPTION: Places a blue 83x42 box at position (93, 93).
; PLAN: r0=93(x), r1=93(y), r2=83(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 93
LDI r2, 83
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
