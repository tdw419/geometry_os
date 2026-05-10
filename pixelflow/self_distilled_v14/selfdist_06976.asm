; DESCRIPTION: Renders a red rectangular region spanning 14 by 87 at (390, 122).
; PLAN: r0=390(x), r1=122(y), r2=14(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 122
LDI r2, 14
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
