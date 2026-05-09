; DESCRIPTION: Draws a yellow rectangle at (32, 113) with width 15 and height 80.
; PLAN: r0=32(x), r1=113(y), r2=15(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 113
LDI r2, 15
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
