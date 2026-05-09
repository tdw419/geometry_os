; DESCRIPTION: Creates a green rectangular region at (34, 172) spanning 23 by 46 pixels.
; PLAN: r0=34(x), r1=172(y), r2=23(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 172
LDI r2, 23
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
