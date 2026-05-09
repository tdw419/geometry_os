; DESCRIPTION: Creates a black rectangular region at (121, 162) spanning 67 by 88 pixels.
; PLAN: r0=121(x), r1=162(y), r2=67(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 162
LDI r2, 67
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
