; DESCRIPTION: Creates a black rectangular region at (159, 36) spanning 36 by 51 pixels.
; PLAN: r0=159(x), r1=36(y), r2=36(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 36
LDI r2, 36
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
