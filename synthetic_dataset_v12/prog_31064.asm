; DESCRIPTION: Creates a black rectangular region at (453, 155) spanning 44 by 52 pixels.
; PLAN: r0=453(x), r1=155(y), r2=44(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 155
LDI r2, 44
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
