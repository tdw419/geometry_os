; DESCRIPTION: Creates a black rectangular region at (389, 118) spanning 66 by 84 pixels.
; PLAN: r0=389(x), r1=118(y), r2=66(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 118
LDI r2, 66
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
