; DESCRIPTION: Draws a green rectangle at (391, 86) with width 111 and height 74.
; PLAN: r0=391(x), r1=86(y), r2=111(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 86
LDI r2, 111
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
