; DESCRIPTION: Creates a black rectangular region at (312, 10) spanning 104 by 52 pixels.
; PLAN: r0=312(x), r1=10(y), r2=104(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 10
LDI r2, 104
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
