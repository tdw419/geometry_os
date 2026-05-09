; DESCRIPTION: Draws a magenta rectangle at (195, 29) with width 25 and height 32.
; PLAN: r0=195(x), r1=29(y), r2=25(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 29
LDI r2, 25
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
