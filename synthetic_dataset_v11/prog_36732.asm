; DESCRIPTION: Draws a yellow rectangle at (98, 113) with width 39 and height 111.
; PLAN: r0=98(x), r1=113(y), r2=39(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 113
LDI r2, 39
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
