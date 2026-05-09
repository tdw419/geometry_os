; DESCRIPTION: Creates a cyan rectangular region at (47, 106) spanning 18 by 88 pixels.
; PLAN: r0=47(x), r1=106(y), r2=18(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 106
LDI r2, 18
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
