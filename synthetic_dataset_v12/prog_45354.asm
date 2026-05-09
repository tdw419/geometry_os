; DESCRIPTION: Draws a yellow rectangle at (324, 129) with width 29 and height 59.
; PLAN: r0=324(x), r1=129(y), r2=29(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 129
LDI r2, 29
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
