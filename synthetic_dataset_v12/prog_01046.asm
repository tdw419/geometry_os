; DESCRIPTION: Draws a magenta rectangle at (42, 151) with width 81 and height 94.
; PLAN: r0=42(x), r1=151(y), r2=81(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 151
LDI r2, 81
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
