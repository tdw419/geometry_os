; DESCRIPTION: Creates a yellow rectangular region at (244, 74) spanning 88 by 56 pixels.
; PLAN: r0=244(x), r1=74(y), r2=88(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 74
LDI r2, 88
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
