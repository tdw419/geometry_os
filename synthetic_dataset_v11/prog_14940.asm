; DESCRIPTION: Renders a blue box of size 10x19 starting at (5, 87).
; PLAN: r0=5(x), r1=87(y), r2=10(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 87
LDI r2, 10
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
