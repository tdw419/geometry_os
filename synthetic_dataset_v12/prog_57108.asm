; DESCRIPTION: Renders a yellow box of size 26x13 starting at (282, 67).
; PLAN: r0=282(x), r1=67(y), r2=26(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 67
LDI r2, 26
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
