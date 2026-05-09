; DESCRIPTION: Creates a black rectangular region at (244, 140) spanning 73 by 94 pixels.
; PLAN: r0=244(x), r1=140(y), r2=73(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 140
LDI r2, 73
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
