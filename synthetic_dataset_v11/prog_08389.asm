; DESCRIPTION: Creates a cyan rectangular region at (97, 49) spanning 65 by 100 pixels.
; PLAN: r0=97(x), r1=49(y), r2=65(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 49
LDI r2, 65
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
