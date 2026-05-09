; DESCRIPTION: Draws a green rectangle at (5, 143) with width 17 and height 111.
; PLAN: r0=5(x), r1=143(y), r2=17(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 143
LDI r2, 17
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
