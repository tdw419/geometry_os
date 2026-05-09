; DESCRIPTION: Draws a magenta rectangle at (267, 93) with width 49 and height 75.
; PLAN: r0=267(x), r1=93(y), r2=49(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 93
LDI r2, 49
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
