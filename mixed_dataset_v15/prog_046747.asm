; DESCRIPTION: Draws a yellow rectangle at (128, 148) with width 86 and height 88.
; PLAN: r0=128(x), r1=148(y), r2=86(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 148
LDI r2, 86
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
