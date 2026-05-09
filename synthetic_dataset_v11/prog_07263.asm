; DESCRIPTION: Creates a black rectangular region at (100, 88) spanning 74 by 58 pixels.
; PLAN: r0=100(x), r1=88(y), r2=74(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 88
LDI r2, 74
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
