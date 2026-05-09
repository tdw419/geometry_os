; DESCRIPTION: Draws a yellow rectangle at (53, 12) with width 99 and height 59.
; PLAN: r0=53(x), r1=12(y), r2=99(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 12
LDI r2, 99
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
