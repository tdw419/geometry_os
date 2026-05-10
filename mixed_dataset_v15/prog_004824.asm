; DESCRIPTION: Renders a red rectangular region spanning 116 by 31 at (212, 118).
; PLAN: r0=212(x), r1=118(y), r2=116(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 118
LDI r2, 116
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
