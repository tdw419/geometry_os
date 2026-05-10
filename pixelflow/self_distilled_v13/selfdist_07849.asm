; DESCRIPTION: Renders a purple rectangular region spanning 75 by 106 at (86, 22).
; PLAN: r0=86(x), r1=22(y), r2=75(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 22
LDI r2, 75
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
