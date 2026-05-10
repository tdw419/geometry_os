; DESCRIPTION: Renders a purple rectangular region spanning 112 by 31 at (137, 16).
; PLAN: r0=137(x), r1=16(y), r2=112(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 16
LDI r2, 112
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
