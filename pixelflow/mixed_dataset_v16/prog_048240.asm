; DESCRIPTION: Draws a magenta rectangle at (290, 63) with width 93 and height 47.
; PLAN: r0=290(x), r1=63(y), r2=93(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 63
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
