; DESCRIPTION: Draws a green rectangle at (240, 222) with width 111 and height 10.
; PLAN: r0=240(x), r1=222(y), r2=111(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 222
LDI r2, 111
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
