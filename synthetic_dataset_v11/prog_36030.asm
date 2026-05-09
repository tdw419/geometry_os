; DESCRIPTION: Renders a purple box of size 20x44 starting at (33, 203).
; PLAN: r0=33(x), r1=203(y), r2=20(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 203
LDI r2, 20
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
