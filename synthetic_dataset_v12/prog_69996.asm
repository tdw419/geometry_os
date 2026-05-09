; DESCRIPTION: Draws a yellow rectangle at (301, 0) with width 58 and height 59.
; PLAN: r0=301(x), r1=0(y), r2=58(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 0
LDI r2, 58
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
