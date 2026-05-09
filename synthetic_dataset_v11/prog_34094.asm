; DESCRIPTION: Creates a cyan rectangular region at (11, 122) spanning 80 by 119 pixels.
; PLAN: r0=11(x), r1=122(y), r2=80(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 122
LDI r2, 80
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
