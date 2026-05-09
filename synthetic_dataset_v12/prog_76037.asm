; DESCRIPTION: Renders a blue box of size 85x25 starting at (421, 20).
; PLAN: r0=421(x), r1=20(y), r2=85(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 20
LDI r2, 85
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
