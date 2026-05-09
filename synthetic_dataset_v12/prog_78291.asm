; DESCRIPTION: Renders a magenta box of size 52x81 starting at (258, 147).
; PLAN: r0=258(x), r1=147(y), r2=52(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 147
LDI r2, 52
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
