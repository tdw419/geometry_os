; DESCRIPTION: Draws a magenta rectangle at (66, 23) with width 93 and height 44.
; PLAN: r0=66(x), r1=23(y), r2=93(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 23
LDI r2, 93
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
