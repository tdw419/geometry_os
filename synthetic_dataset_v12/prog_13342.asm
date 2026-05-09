; DESCRIPTION: Creates a red rectangular region at (137, 200) spanning 76 by 51 pixels.
; PLAN: r0=137(x), r1=200(y), r2=76(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 200
LDI r2, 76
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
