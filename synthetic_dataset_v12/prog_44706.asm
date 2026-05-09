; DESCRIPTION: Renders a purple box of size 37x75 starting at (74, 52).
; PLAN: r0=74(x), r1=52(y), r2=37(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 52
LDI r2, 37
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
