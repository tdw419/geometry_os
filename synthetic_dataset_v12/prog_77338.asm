; DESCRIPTION: Renders a blue box of size 58x68 starting at (105, 136).
; PLAN: r0=105(x), r1=136(y), r2=58(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 136
LDI r2, 58
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
