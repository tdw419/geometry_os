; DESCRIPTION: Creates a black rectangular region at (74, 137) spanning 86 by 52 pixels.
; PLAN: r0=74(x), r1=137(y), r2=86(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 137
LDI r2, 86
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
