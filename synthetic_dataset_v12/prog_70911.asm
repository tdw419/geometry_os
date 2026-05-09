; DESCRIPTION: Draws a yellow rectangle at (112, 5) with width 48 and height 69.
; PLAN: r0=112(x), r1=5(y), r2=48(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 5
LDI r2, 48
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
