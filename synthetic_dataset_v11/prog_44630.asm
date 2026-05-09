; DESCRIPTION: Creates a black rectangular region at (51, 141) spanning 92 by 79 pixels.
; PLAN: r0=51(x), r1=141(y), r2=92(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 141
LDI r2, 92
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
