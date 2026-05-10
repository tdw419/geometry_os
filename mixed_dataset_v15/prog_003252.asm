; DESCRIPTION: Draws a yellow rectangle at (243, 88) with width 119 and height 72.
; PLAN: r0=243(x), r1=88(y), r2=119(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 88
LDI r2, 119
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
