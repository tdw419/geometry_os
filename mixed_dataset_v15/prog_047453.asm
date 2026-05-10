; DESCRIPTION: Draws a yellow rectangle at (416, 113) with width 48 and height 56.
; PLAN: r0=416(x), r1=113(y), r2=48(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 113
LDI r2, 48
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
