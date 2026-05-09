; DESCRIPTION: Renders a blue box of size 112x29 starting at (18, 67).
; PLAN: r0=18(x), r1=67(y), r2=112(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 67
LDI r2, 112
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
