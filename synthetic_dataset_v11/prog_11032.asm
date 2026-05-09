; DESCRIPTION: Creates a black rectangular region at (27, 135) spanning 88 by 35 pixels.
; PLAN: r0=27(x), r1=135(y), r2=88(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 135
LDI r2, 88
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
