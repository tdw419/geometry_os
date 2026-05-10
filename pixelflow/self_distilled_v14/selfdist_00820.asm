; DESCRIPTION: Draws a magenta rectangle at (362, 192) with width 91 and height 112.
; PLAN: r0=362(x), r1=192(y), r2=91(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 192
LDI r2, 91
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
