; DESCRIPTION: Creates a red rectangular region at (51, 33) spanning 107 by 88 pixels.
; PLAN: r0=51(x), r1=33(y), r2=107(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 33
LDI r2, 107
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
