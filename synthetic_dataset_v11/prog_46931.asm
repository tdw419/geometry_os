; DESCRIPTION: Renders a green box of size 32x60 starting at (62, 85).
; PLAN: r0=62(x), r1=85(y), r2=32(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 85
LDI r2, 32
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
