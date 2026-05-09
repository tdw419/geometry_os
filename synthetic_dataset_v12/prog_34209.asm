; DESCRIPTION: Creates a black rectangular region at (43, 219) spanning 74 by 24 pixels.
; PLAN: r0=43(x), r1=219(y), r2=74(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 219
LDI r2, 74
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
