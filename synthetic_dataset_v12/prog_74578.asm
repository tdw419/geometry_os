; DESCRIPTION: Renders a purple box of size 113x34 starting at (94, 66).
; PLAN: r0=94(x), r1=66(y), r2=113(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 66
LDI r2, 113
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
