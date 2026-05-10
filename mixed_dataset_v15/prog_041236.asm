; DESCRIPTION: Draws a yellow rectangle at (350, 166) with width 39 and height 31.
; PLAN: r0=350(x), r1=166(y), r2=39(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 166
LDI r2, 39
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
