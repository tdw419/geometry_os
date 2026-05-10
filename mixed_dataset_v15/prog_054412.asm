; DESCRIPTION: Renders a purple rectangular region spanning 83 by 87 at (8, 70).
; PLAN: r0=8(x), r1=70(y), r2=83(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 70
LDI r2, 83
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
