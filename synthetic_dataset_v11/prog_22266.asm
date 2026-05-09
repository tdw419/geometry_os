; DESCRIPTION: Creates a yellow rectangular region at (71, 137) spanning 35 by 117 pixels.
; PLAN: r0=71(x), r1=137(y), r2=35(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 137
LDI r2, 35
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
