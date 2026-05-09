; DESCRIPTION: Creates a black rectangular region at (96, 138) spanning 88 by 49 pixels.
; PLAN: r0=96(x), r1=138(y), r2=88(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 138
LDI r2, 88
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
