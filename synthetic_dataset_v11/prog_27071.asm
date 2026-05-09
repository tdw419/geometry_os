; DESCRIPTION: Draws a yellow rectangle at (86, 169) with width 39 and height 50.
; PLAN: r0=86(x), r1=169(y), r2=39(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 169
LDI r2, 39
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
