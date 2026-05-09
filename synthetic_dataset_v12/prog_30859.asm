; DESCRIPTION: Creates a blue rectangular region at (291, 198) spanning 14 by 49 pixels.
; PLAN: r0=291(x), r1=198(y), r2=14(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 198
LDI r2, 14
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
