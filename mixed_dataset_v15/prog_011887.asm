; DESCRIPTION: Creates a black rectangular region at (51, 127) spanning 118 by 109 pixels.
; PLAN: r0=51(x), r1=127(y), r2=118(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 127
LDI r2, 118
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
