; DESCRIPTION: Draws a magenta rectangle at (45, 39) with width 79 and height 25.
; PLAN: r0=45(x), r1=39(y), r2=79(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 39
LDI r2, 79
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
