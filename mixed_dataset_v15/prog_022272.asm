; DESCRIPTION: Creates a black rectangular region at (244, 102) spanning 117 by 84 pixels.
; PLAN: r0=244(x), r1=102(y), r2=117(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 102
LDI r2, 117
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
