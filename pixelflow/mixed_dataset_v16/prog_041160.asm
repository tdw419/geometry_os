; DESCRIPTION: Renders a purple rectangular region spanning 58 by 90 at (211, 73).
; PLAN: r0=211(x), r1=73(y), r2=58(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 73
LDI r2, 58
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
