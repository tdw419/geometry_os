; DESCRIPTION: Renders a purple rectangular region spanning 23 by 81 at (260, 135).
; PLAN: r0=260(x), r1=135(y), r2=23(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 135
LDI r2, 23
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
