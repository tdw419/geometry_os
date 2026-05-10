; DESCRIPTION: Draws a magenta rectangle at (125, 51) with width 54 and height 21.
; PLAN: r0=125(x), r1=51(y), r2=54(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 51
LDI r2, 54
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
