; DESCRIPTION: Creates a yellow rectangular region at (4, 137) spanning 15 by 38 pixels.
; PLAN: r0=4(x), r1=137(y), r2=15(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 137
LDI r2, 15
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
