; DESCRIPTION: Creates a cyan rectangular region at (244, 80) spanning 108 by 19 pixels.
; PLAN: r0=244(x), r1=80(y), r2=108(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 80
LDI r2, 108
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
