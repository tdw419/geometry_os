; DESCRIPTION: Renders a blue box of size 64x10 starting at (36, 66).
; PLAN: r0=36(x), r1=66(y), r2=64(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 66
LDI r2, 64
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
