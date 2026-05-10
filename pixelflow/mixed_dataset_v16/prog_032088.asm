; DESCRIPTION: Draws a magenta rectangle at (362, 200) with width 12 and height 105.
; PLAN: r0=362(x), r1=200(y), r2=12(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 200
LDI r2, 12
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
