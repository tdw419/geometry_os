; DESCRIPTION: Draws a magenta rectangle at (352, 141) with width 106 and height 17.
; PLAN: r0=352(x), r1=141(y), r2=106(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 141
LDI r2, 106
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
