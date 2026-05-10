; DESCRIPTION: Renders a purple rectangular region spanning 52 by 21 at (188, 25).
; PLAN: r0=188(x), r1=25(y), r2=52(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 25
LDI r2, 52
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
