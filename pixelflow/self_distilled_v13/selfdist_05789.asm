; DESCRIPTION: Renders a purple rectangular region spanning 36 by 11 at (48, 118).
; PLAN: r0=48(x), r1=118(y), r2=36(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 118
LDI r2, 36
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
