; DESCRIPTION: Renders a red rectangular region spanning 35 by 49 at (304, 179).
; PLAN: r0=304(x), r1=179(y), r2=35(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 179
LDI r2, 35
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
