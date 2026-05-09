; DESCRIPTION: Draws a yellow rectangle at (113, 8) with width 56 and height 20.
; PLAN: r0=113(x), r1=8(y), r2=56(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 8
LDI r2, 56
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
