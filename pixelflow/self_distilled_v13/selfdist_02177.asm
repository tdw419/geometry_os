; DESCRIPTION: Renders a red rectangular region spanning 107 by 92 at (33, 33).
; PLAN: r0=33(x), r1=33(y), r2=107(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 33
LDI r2, 107
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
