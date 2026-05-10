; DESCRIPTION: Renders a red rectangular region spanning 65 by 52 at (378, 85).
; PLAN: r0=378(x), r1=85(y), r2=65(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 85
LDI r2, 65
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
