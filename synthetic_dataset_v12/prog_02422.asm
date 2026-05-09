; DESCRIPTION: Creates a cyan rectangular region at (97, 115) spanning 99 by 38 pixels.
; PLAN: r0=97(x), r1=115(y), r2=99(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 115
LDI r2, 99
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
