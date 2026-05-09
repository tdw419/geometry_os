; DESCRIPTION: Creates a yellow rectangular region at (200, 162) spanning 46 by 11 pixels.
; PLAN: r0=200(x), r1=162(y), r2=46(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 162
LDI r2, 46
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
