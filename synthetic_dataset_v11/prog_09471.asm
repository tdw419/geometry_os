; DESCRIPTION: Creates a black rectangular region at (36, 219) spanning 78 by 13 pixels.
; PLAN: r0=36(x), r1=219(y), r2=78(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 219
LDI r2, 78
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
