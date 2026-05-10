; DESCRIPTION: Renders a purple rectangular region spanning 98 by 97 at (297, 75).
; PLAN: r0=297(x), r1=75(y), r2=98(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 75
LDI r2, 98
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
