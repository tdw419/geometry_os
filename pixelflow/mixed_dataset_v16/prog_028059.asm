; DESCRIPTION: Renders a purple rectangular region spanning 110 by 54 at (175, 87).
; PLAN: r0=175(x), r1=87(y), r2=110(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 87
LDI r2, 110
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
