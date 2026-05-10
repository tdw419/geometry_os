; DESCRIPTION: Renders a red rectangular region spanning 52 by 94 at (74, 49).
; PLAN: r0=74(x), r1=49(y), r2=52(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 49
LDI r2, 52
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
