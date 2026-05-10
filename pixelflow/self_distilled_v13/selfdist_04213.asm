; DESCRIPTION: Renders a purple rectangular region spanning 19 by 97 at (228, 200).
; PLAN: r0=228(x), r1=200(y), r2=19(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 200
LDI r2, 19
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
