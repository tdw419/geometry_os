; DESCRIPTION: Draws a green rectangle at (148, 63) with width 35 and height 111.
; PLAN: r0=148(x), r1=63(y), r2=35(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 63
LDI r2, 35
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
