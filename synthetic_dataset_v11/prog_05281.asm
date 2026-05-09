; DESCRIPTION: Creates a cyan rectangular region at (26, 88) spanning 25 by 46 pixels.
; PLAN: r0=26(x), r1=88(y), r2=25(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 88
LDI r2, 25
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
