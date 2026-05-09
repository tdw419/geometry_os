; DESCRIPTION: Creates a black rectangular region at (35, 135) spanning 89 by 13 pixels.
; PLAN: r0=35(x), r1=135(y), r2=89(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 135
LDI r2, 89
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
