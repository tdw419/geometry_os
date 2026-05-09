; DESCRIPTION: Draws a yellow rectangle at (440, 204) with width 24 and height 44.
; PLAN: r0=440(x), r1=204(y), r2=24(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 204
LDI r2, 24
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
