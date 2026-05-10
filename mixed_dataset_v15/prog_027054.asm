; DESCRIPTION: Draws a yellow rectangle at (159, 8) with width 94 and height 29.
; PLAN: r0=159(x), r1=8(y), r2=94(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 8
LDI r2, 94
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
