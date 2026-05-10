; DESCRIPTION: Creates a black rectangular region at (164, 58) spanning 35 by 97 pixels.
; PLAN: r0=164(x), r1=58(y), r2=35(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 58
LDI r2, 35
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
