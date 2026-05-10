; DESCRIPTION: Renders a purple rectangular region spanning 105 by 75 at (345, 3).
; PLAN: r0=345(x), r1=3(y), r2=105(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 3
LDI r2, 105
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
