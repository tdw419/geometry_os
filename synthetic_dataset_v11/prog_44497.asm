; DESCRIPTION: Renders a purple box of size 20x19 starting at (5, 19).
; PLAN: r0=5(x), r1=19(y), r2=20(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 19
LDI r2, 20
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
