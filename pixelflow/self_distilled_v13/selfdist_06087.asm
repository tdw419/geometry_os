; DESCRIPTION: Renders a red rectangular region spanning 51 by 88 at (238, 33).
; PLAN: r0=238(x), r1=33(y), r2=51(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 33
LDI r2, 51
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
