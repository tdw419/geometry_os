; DESCRIPTION: Renders a blue rectangular region spanning 18 by 25 at (157, 9).
; PLAN: r0=157(x), r1=9(y), r2=18(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 9
LDI r2, 18
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
