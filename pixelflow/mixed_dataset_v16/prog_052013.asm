; DESCRIPTION: Creates a yellow rectangular region at (459, 61) spanning 17 by 52 pixels.
; PLAN: r0=459(x), r1=61(y), r2=17(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 61
LDI r2, 17
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
