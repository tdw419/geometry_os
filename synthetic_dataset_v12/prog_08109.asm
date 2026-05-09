; DESCRIPTION: Creates a red rectangular region at (51, 184) spanning 92 by 66 pixels.
; PLAN: r0=51(x), r1=184(y), r2=92(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 184
LDI r2, 92
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
