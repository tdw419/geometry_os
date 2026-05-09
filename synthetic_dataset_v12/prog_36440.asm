; DESCRIPTION: Draws a yellow rectangle at (37, 148) with width 111 and height 59.
; PLAN: r0=37(x), r1=148(y), r2=111(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 148
LDI r2, 111
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
