; DESCRIPTION: Draws a magenta rectangle at (9, 40) with width 93 and height 117.
; PLAN: r0=9(x), r1=40(y), r2=93(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 40
LDI r2, 93
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
