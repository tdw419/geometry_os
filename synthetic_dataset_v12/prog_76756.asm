; DESCRIPTION: Creates a yellow rectangular region at (312, 167) spanning 91 by 19 pixels.
; PLAN: r0=312(x), r1=167(y), r2=91(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 167
LDI r2, 91
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
