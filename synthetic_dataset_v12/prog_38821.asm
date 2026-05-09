; DESCRIPTION: Creates a cyan rectangular region at (258, 122) spanning 106 by 47 pixels.
; PLAN: r0=258(x), r1=122(y), r2=106(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 122
LDI r2, 106
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
