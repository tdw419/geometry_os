; DESCRIPTION: Draws a green rectangle at (232, 111) with width 50 and height 17.
; PLAN: r0=232(x), r1=111(y), r2=50(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 111
LDI r2, 50
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
