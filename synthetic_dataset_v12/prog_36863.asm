; DESCRIPTION: Creates a cyan rectangular region at (326, 88) spanning 46 by 106 pixels.
; PLAN: r0=326(x), r1=88(y), r2=46(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 88
LDI r2, 46
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
