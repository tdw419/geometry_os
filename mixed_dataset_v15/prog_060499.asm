; DESCRIPTION: Creates a cyan rectangular region at (244, 181) spanning 78 by 35 pixels.
; PLAN: r0=244(x), r1=181(y), r2=78(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 181
LDI r2, 78
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
