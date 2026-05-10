; DESCRIPTION: Renders a purple rectangular region spanning 95 by 97 at (139, 199).
; PLAN: r0=139(x), r1=199(y), r2=95(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 199
LDI r2, 95
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
