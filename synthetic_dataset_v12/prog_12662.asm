; DESCRIPTION: Renders a blue box of size 112x67 starting at (43, 105).
; PLAN: r0=43(x), r1=105(y), r2=112(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 105
LDI r2, 112
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
