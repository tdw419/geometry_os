; DESCRIPTION: Draws a blue rectangle at (369, 204) with width 60 and height 29.
; PLAN: r0=369(x), r1=204(y), r2=60(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 204
LDI r2, 60
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
