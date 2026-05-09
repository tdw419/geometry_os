; DESCRIPTION: Creates a green rectangular region at (181, 175) spanning 29 by 26 pixels.
; PLAN: r0=181(x), r1=175(y), r2=29(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 175
LDI r2, 29
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
