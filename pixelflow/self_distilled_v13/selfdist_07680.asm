; DESCRIPTION: Renders a purple rectangular region spanning 100 by 66 at (198, 119).
; PLAN: r0=198(x), r1=119(y), r2=100(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 119
LDI r2, 100
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
