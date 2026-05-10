; DESCRIPTION: Renders a red rectangular region spanning 109 by 68 at (31, 158).
; PLAN: r0=31(x), r1=158(y), r2=109(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 158
LDI r2, 109
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
