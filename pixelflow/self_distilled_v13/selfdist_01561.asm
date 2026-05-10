; DESCRIPTION: Renders a red rectangular region spanning 78 by 37 at (105, 94).
; PLAN: r0=105(x), r1=94(y), r2=78(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 94
LDI r2, 78
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
