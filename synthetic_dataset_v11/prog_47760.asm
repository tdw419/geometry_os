; DESCRIPTION: Renders a purple box of size 15x78 starting at (20, 50).
; PLAN: r0=20(x), r1=50(y), r2=15(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 50
LDI r2, 15
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
