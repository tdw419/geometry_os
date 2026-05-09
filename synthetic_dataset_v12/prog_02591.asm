; DESCRIPTION: Creates a yellow rectangular region at (253, 5) spanning 88 by 83 pixels.
; PLAN: r0=253(x), r1=5(y), r2=88(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 5
LDI r2, 88
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
