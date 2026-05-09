; DESCRIPTION: Creates a black rectangular region at (448, 12) spanning 35 by 41 pixels.
; PLAN: r0=448(x), r1=12(y), r2=35(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 12
LDI r2, 35
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
