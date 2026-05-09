; DESCRIPTION: Creates a purple rectangular region at (155, 145) spanning 25 by 19 pixels.
; PLAN: r0=155(x), r1=145(y), r2=25(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 145
LDI r2, 25
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
