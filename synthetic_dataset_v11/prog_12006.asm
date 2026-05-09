; DESCRIPTION: Draws a yellow rectangle at (74, 50) with width 86 and height 59.
; PLAN: r0=74(x), r1=50(y), r2=86(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 50
LDI r2, 86
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
