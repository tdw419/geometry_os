; DESCRIPTION: Creates a black rectangular region at (419, 7) spanning 52 by 66 pixels.
; PLAN: r0=419(x), r1=7(y), r2=52(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 7
LDI r2, 52
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
