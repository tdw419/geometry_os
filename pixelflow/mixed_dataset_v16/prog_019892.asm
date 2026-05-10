; DESCRIPTION: Renders a purple box of size 77x18 starting at (411, 74).
; PLAN: r0=411(x), r1=74(y), r2=77(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 74
LDI r2, 77
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
