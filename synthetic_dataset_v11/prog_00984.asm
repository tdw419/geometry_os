; DESCRIPTION: Creates a black rectangular region at (75, 0) spanning 51 by 117 pixels.
; PLAN: r0=75(x), r1=0(y), r2=51(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 0
LDI r2, 51
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
