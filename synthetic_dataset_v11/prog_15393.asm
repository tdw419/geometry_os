; DESCRIPTION: Renders a purple box of size 73x37 starting at (116, 147).
; PLAN: r0=116(x), r1=147(y), r2=73(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 147
LDI r2, 73
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
