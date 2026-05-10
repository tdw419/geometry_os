; DESCRIPTION: Renders a purple rectangular region spanning 100 by 46 at (80, 97).
; PLAN: r0=80(x), r1=97(y), r2=100(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 97
LDI r2, 100
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
