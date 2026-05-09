; DESCRIPTION: Creates a blue rectangular region at (31, 35) spanning 91 by 13 pixels.
; PLAN: r0=31(x), r1=35(y), r2=91(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 35
LDI r2, 91
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
