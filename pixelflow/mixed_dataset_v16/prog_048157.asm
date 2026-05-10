; DESCRIPTION: Renders a red rectangular region spanning 118 by 118 at (196, 179).
; PLAN: r0=196(x), r1=179(y), r2=118(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 179
LDI r2, 118
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
