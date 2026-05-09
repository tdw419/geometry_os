; DESCRIPTION: Renders a purple box of size 119x74 starting at (7, 150).
; PLAN: r0=7(x), r1=150(y), r2=119(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 150
LDI r2, 119
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
