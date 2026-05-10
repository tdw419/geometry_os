; DESCRIPTION: Draws a magenta rectangle at (23, 20) with width 91 and height 51.
; PLAN: r0=23(x), r1=20(y), r2=91(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 91
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
