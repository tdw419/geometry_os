; DESCRIPTION: Creates a purple rectangular region at (447, 88) spanning 14 by 10 pixels.
; PLAN: r0=447(x), r1=88(y), r2=14(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 88
LDI r2, 14
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
