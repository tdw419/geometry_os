; DESCRIPTION: Renders a blue box of size 13x71 starting at (287, 88).
; PLAN: r0=287(x), r1=88(y), r2=13(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 88
LDI r2, 13
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
