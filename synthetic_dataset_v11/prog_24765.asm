; DESCRIPTION: Renders a purple box of size 40x44 starting at (81, 66).
; PLAN: r0=81(x), r1=66(y), r2=40(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 66
LDI r2, 40
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
