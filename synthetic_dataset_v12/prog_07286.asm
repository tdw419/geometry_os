; DESCRIPTION: Draws a yellow rectangle at (368, 108) with width 92 and height 59.
; PLAN: r0=368(x), r1=108(y), r2=92(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 108
LDI r2, 92
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
