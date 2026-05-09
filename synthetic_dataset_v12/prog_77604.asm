; DESCRIPTION: Creates a cyan rectangular region at (339, 105) spanning 118 by 108 pixels.
; PLAN: r0=339(x), r1=105(y), r2=118(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 105
LDI r2, 118
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
