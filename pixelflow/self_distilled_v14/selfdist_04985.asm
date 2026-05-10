; DESCRIPTION: Renders a red rectangular region spanning 73 by 119 at (306, 178).
; PLAN: r0=306(x), r1=178(y), r2=73(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 178
LDI r2, 73
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
