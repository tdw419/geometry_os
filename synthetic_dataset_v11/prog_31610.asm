; DESCRIPTION: Draws a black rectangle at (80, 165) with width 17 and height 59.
; PLAN: r0=80(x), r1=165(y), r2=17(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 165
LDI r2, 17
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
