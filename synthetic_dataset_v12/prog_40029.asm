; DESCRIPTION: Renders a green box of size 67x65 starting at (227, 136).
; PLAN: r0=227(x), r1=136(y), r2=67(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 136
LDI r2, 67
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
