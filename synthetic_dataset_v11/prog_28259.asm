; DESCRIPTION: Renders a purple box of size 22x18 starting at (20, 4).
; PLAN: r0=20(x), r1=4(y), r2=22(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 4
LDI r2, 22
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
