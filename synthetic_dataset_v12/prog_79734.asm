; DESCRIPTION: Renders a purple box of size 99x74 starting at (340, 147).
; PLAN: r0=340(x), r1=147(y), r2=99(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 147
LDI r2, 99
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
