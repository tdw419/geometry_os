; DESCRIPTION: Draws a yellow rectangle at (12, 36) with width 83 and height 59.
; PLAN: r0=12(x), r1=36(y), r2=83(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 36
LDI r2, 83
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
