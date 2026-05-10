; DESCRIPTION: Creates a blue filled rectangle of size 20x37 starting at (177, 64).
; PLAN: r0=177(x), r1=64(y), r2=20(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 64
LDI r2, 20
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
