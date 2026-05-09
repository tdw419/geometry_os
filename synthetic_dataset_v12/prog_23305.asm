; DESCRIPTION: Draws a magenta rectangle at (185, 42) with width 25 and height 37.
; PLAN: r0=185(x), r1=42(y), r2=25(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 42
LDI r2, 25
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
