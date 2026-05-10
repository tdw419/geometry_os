; DESCRIPTION: Renders a purple rectangular region spanning 15 by 78 at (210, 64).
; PLAN: r0=210(x), r1=64(y), r2=15(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 64
LDI r2, 15
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
