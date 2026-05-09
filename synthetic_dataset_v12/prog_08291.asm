; DESCRIPTION: Creates a black rectangular region at (34, 88) spanning 58 by 67 pixels.
; PLAN: r0=34(x), r1=88(y), r2=58(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 88
LDI r2, 58
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
