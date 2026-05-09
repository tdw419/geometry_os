; DESCRIPTION: Renders a purple box of size 52x73 starting at (147, 102).
; PLAN: r0=147(x), r1=102(y), r2=52(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 102
LDI r2, 52
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
