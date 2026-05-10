; DESCRIPTION: Renders a purple rectangular region spanning 64 by 51 at (49, 180).
; PLAN: r0=49(x), r1=180(y), r2=64(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 180
LDI r2, 64
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
