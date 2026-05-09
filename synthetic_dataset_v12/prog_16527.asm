; DESCRIPTION: Creates a blue rectangular region at (475, 19) spanning 20 by 97 pixels.
; PLAN: r0=475(x), r1=19(y), r2=20(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 19
LDI r2, 20
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
