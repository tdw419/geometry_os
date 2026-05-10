; DESCRIPTION: Renders a purple rectangular region spanning 118 by 62 at (360, 65).
; PLAN: r0=360(x), r1=65(y), r2=118(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 65
LDI r2, 118
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
