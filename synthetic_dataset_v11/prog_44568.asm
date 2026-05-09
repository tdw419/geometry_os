; DESCRIPTION: Creates a black rectangular region at (52, 155) spanning 36 by 11 pixels.
; PLAN: r0=52(x), r1=155(y), r2=36(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 155
LDI r2, 36
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
