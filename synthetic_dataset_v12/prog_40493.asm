; DESCRIPTION: Creates a purple rectangular region at (160, 119) spanning 105 by 97 pixels.
; PLAN: r0=160(x), r1=119(y), r2=105(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 119
LDI r2, 105
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
