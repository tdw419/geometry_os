; DESCRIPTION: Creates a black rectangular region at (36, 19) spanning 87 by 18 pixels.
; PLAN: r0=36(x), r1=19(y), r2=87(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 19
LDI r2, 87
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
