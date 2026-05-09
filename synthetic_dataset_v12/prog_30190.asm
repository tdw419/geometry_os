; DESCRIPTION: Draws a black rectangle at (373, 166) with width 17 and height 37.
; PLAN: r0=373(x), r1=166(y), r2=17(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 166
LDI r2, 17
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
