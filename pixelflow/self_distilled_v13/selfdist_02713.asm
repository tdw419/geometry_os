; DESCRIPTION: Draws a magenta rectangle at (44, 168) with width 54 and height 75.
; PLAN: r0=44(x), r1=168(y), r2=54(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 168
LDI r2, 54
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
