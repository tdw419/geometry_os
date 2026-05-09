; DESCRIPTION: Creates a black rectangular region at (420, 88) spanning 22 by 54 pixels.
; PLAN: r0=420(x), r1=88(y), r2=22(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 88
LDI r2, 22
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
