; DESCRIPTION: Renders a purple box of size 74x34 starting at (106, 180).
; PLAN: r0=106(x), r1=180(y), r2=74(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 180
LDI r2, 74
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
