; DESCRIPTION: Draws a green rectangle at (369, 160) with width 108 and height 64.
; PLAN: r0=369(x), r1=160(y), r2=108(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 160
LDI r2, 108
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
