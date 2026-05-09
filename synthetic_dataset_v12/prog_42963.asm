; DESCRIPTION: Creates a black rectangular region at (6, 74) spanning 105 by 43 pixels.
; PLAN: r0=6(x), r1=74(y), r2=105(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 74
LDI r2, 105
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
