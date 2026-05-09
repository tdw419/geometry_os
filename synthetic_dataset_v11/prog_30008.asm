; DESCRIPTION: Creates a cyan rectangular region at (31, 198) spanning 76 by 18 pixels.
; PLAN: r0=31(x), r1=198(y), r2=76(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 198
LDI r2, 76
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
