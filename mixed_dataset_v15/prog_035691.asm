; DESCRIPTION: Renders a red rectangular region spanning 61 by 54 at (303, 185).
; PLAN: r0=303(x), r1=185(y), r2=61(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 185
LDI r2, 61
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
