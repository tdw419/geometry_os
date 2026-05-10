; DESCRIPTION: Creates a black rectangular region at (447, 172) spanning 52 by 19 pixels.
; PLAN: r0=447(x), r1=172(y), r2=52(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 172
LDI r2, 52
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
