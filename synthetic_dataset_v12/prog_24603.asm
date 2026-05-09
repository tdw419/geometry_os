; DESCRIPTION: Creates a black rectangular region at (375, 118) spanning 64 by 88 pixels.
; PLAN: r0=375(x), r1=118(y), r2=64(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 118
LDI r2, 64
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
