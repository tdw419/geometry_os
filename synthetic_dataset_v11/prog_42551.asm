; DESCRIPTION: Renders a purple box of size 15x85 starting at (5, 9).
; PLAN: r0=5(x), r1=9(y), r2=15(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 9
LDI r2, 15
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
