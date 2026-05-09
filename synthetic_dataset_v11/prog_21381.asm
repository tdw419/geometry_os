; DESCRIPTION: Creates a black rectangular region at (155, 134) spanning 52 by 51 pixels.
; PLAN: r0=155(x), r1=134(y), r2=52(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 134
LDI r2, 52
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
