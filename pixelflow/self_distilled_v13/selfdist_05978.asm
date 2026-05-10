; DESCRIPTION: Renders a purple rectangular region spanning 35 by 64 at (66, 133).
; PLAN: r0=66(x), r1=133(y), r2=35(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 133
LDI r2, 35
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
