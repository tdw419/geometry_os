; DESCRIPTION: Creates a cyan rectangular region at (244, 44) spanning 76 by 73 pixels.
; PLAN: r0=244(x), r1=44(y), r2=76(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 44
LDI r2, 76
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
