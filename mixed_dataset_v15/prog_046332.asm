; DESCRIPTION: Creates a yellow rectangular region at (99, 55) spanning 88 by 31 pixels.
; PLAN: r0=99(x), r1=55(y), r2=88(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 55
LDI r2, 88
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
