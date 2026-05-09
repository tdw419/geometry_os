; DESCRIPTION: Creates a yellow rectangular region at (13, 137) spanning 10 by 102 pixels.
; PLAN: r0=13(x), r1=137(y), r2=10(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 137
LDI r2, 10
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
