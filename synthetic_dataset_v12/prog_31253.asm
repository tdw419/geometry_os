; DESCRIPTION: Renders a blue box of size 111x75 starting at (9, 97).
; PLAN: r0=9(x), r1=97(y), r2=111(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 97
LDI r2, 111
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
