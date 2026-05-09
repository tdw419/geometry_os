; DESCRIPTION: Renders a purple box of size 91x88 starting at (412, 56).
; PLAN: r0=412(x), r1=56(y), r2=91(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 56
LDI r2, 91
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
