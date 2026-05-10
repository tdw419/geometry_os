; DESCRIPTION: Renders a red rectangular region spanning 94 by 55 at (339, 183).
; PLAN: r0=339(x), r1=183(y), r2=94(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 183
LDI r2, 94
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
