; DESCRIPTION: Creates a black rectangular region at (428, 88) spanning 19 by 54 pixels.
; PLAN: r0=428(x), r1=88(y), r2=19(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 88
LDI r2, 19
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
