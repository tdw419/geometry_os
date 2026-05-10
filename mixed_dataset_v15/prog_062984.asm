; DESCRIPTION: Creates a yellow rectangular region at (385, 22) spanning 30 by 88 pixels.
; PLAN: r0=385(x), r1=22(y), r2=30(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 22
LDI r2, 30
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
