; DESCRIPTION: Creates a yellow rectangular region at (221, 137) spanning 88 by 72 pixels.
; PLAN: r0=221(x), r1=137(y), r2=88(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 137
LDI r2, 88
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
