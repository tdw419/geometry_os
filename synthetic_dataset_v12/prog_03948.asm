; DESCRIPTION: Creates a black rectangular region at (342, 135) spanning 51 by 11 pixels.
; PLAN: r0=342(x), r1=135(y), r2=51(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 135
LDI r2, 51
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
