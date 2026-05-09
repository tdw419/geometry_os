; DESCRIPTION: Draws a yellow rectangle at (474, 136) with width 35 and height 64.
; PLAN: r0=474(x), r1=136(y), r2=35(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 136
LDI r2, 35
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
