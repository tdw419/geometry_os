; DESCRIPTION: Draws a magenta rectangle at (57, 51) with width 59 and height 13.
; PLAN: r0=57(x), r1=51(y), r2=59(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 51
LDI r2, 59
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
