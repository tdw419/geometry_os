; DESCRIPTION: Draws a magenta rectangle at (82, 127) with width 112 and height 47.
; PLAN: r0=82(x), r1=127(y), r2=112(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 127
LDI r2, 112
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
