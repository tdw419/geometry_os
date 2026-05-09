; DESCRIPTION: Creates a purple rectangular region at (130, 60) spanning 25 by 97 pixels.
; PLAN: r0=130(x), r1=60(y), r2=25(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 60
LDI r2, 25
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
