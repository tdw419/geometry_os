; DESCRIPTION: Draws a yellow rectangle at (350, 94) with width 59 and height 108.
; PLAN: r0=350(x), r1=94(y), r2=59(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 94
LDI r2, 59
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
