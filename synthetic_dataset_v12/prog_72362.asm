; DESCRIPTION: Draws a magenta rectangle at (165, 21) with width 49 and height 79.
; PLAN: r0=165(x), r1=21(y), r2=49(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 21
LDI r2, 49
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
