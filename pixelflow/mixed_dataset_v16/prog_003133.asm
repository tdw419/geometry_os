; DESCRIPTION: Renders a magenta box of size 64x106 starting at (71, 13).
; PLAN: r0=71(x), r1=13(y), r2=64(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 13
LDI r2, 64
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
