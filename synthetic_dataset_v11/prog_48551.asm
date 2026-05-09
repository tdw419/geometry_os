; DESCRIPTION: Creates a black rectangular region at (51, 7) spanning 14 by 50 pixels.
; PLAN: r0=51(x), r1=7(y), r2=14(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 7
LDI r2, 14
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
