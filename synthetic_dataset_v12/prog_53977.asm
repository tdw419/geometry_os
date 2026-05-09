; DESCRIPTION: Draws a magenta rectangle at (84, 125) with width 48 and height 111.
; PLAN: r0=84(x), r1=125(y), r2=48(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 125
LDI r2, 48
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
