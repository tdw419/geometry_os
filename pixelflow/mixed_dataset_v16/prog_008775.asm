; DESCRIPTION: Draws a yellow rectangle at (285, 63) with width 19 and height 40.
; PLAN: r0=285(x), r1=63(y), r2=19(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 63
LDI r2, 19
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
