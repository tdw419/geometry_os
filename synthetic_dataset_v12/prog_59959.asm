; DESCRIPTION: Creates a black rectangular region at (19, 33) spanning 118 by 70 pixels.
; PLAN: r0=19(x), r1=33(y), r2=118(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 33
LDI r2, 118
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
