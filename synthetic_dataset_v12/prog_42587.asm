; DESCRIPTION: Draws a magenta rectangle at (79, 42) with width 19 and height 105.
; PLAN: r0=79(x), r1=42(y), r2=19(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 42
LDI r2, 19
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
