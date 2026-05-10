; DESCRIPTION: Renders a purple box of size 37x75 starting at (231, 32).
; PLAN: r0=231(x), r1=32(y), r2=37(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 32
LDI r2, 37
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
