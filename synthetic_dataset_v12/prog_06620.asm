; DESCRIPTION: Creates a red rectangular region at (244, 33) spanning 97 by 15 pixels.
; PLAN: r0=244(x), r1=33(y), r2=97(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 33
LDI r2, 97
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
