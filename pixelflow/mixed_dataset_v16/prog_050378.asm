; DESCRIPTION: Draws a magenta rectangle at (302, 25) with width 109 and height 27.
; PLAN: r0=302(x), r1=25(y), r2=109(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 25
LDI r2, 109
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
