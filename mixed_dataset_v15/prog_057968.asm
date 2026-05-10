; DESCRIPTION: Renders a purple rectangular region spanning 71 by 75 at (110, 93).
; PLAN: r0=110(x), r1=93(y), r2=71(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 93
LDI r2, 71
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
