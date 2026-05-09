; DESCRIPTION: Creates a yellow rectangular region at (34, 20) spanning 11 by 100 pixels.
; PLAN: r0=34(x), r1=20(y), r2=11(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 20
LDI r2, 11
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
