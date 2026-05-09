; DESCRIPTION: Creates a yellow rectangular region at (67, 178) spanning 88 by 29 pixels.
; PLAN: r0=67(x), r1=178(y), r2=88(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 178
LDI r2, 88
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
