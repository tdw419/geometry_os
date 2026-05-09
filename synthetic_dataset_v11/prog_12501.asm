; DESCRIPTION: Creates a purple rectangular region at (44, 97) spanning 70 by 74 pixels.
; PLAN: r0=44(x), r1=97(y), r2=70(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 97
LDI r2, 70
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
