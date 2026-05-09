; DESCRIPTION: Renders a blue box of size 85x14 starting at (181, 4).
; PLAN: r0=181(x), r1=4(y), r2=85(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 4
LDI r2, 85
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
