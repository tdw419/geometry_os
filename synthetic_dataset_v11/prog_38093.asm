; DESCRIPTION: Draws a magenta rectangle at (164, 51) with width 71 and height 87.
; PLAN: r0=164(x), r1=51(y), r2=71(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 51
LDI r2, 71
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
