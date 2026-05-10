; DESCRIPTION: Renders a purple rectangular region spanning 68 by 100 at (139, 37).
; PLAN: r0=139(x), r1=37(y), r2=68(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 37
LDI r2, 68
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
