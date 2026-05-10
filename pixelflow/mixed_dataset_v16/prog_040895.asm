; DESCRIPTION: Creates a black rectangular region at (1, 74) spanning 88 by 64 pixels.
; PLAN: r0=1(x), r1=74(y), r2=88(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 74
LDI r2, 88
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
