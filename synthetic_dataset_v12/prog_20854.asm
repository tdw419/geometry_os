; DESCRIPTION: Creates a black rectangular region at (325, 117) spanning 117 by 51 pixels.
; PLAN: r0=325(x), r1=117(y), r2=117(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 117
LDI r2, 117
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
