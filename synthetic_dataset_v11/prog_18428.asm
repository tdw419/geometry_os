; DESCRIPTION: Draws a magenta rectangle at (174, 162) with width 66 and height 42.
; PLAN: r0=174(x), r1=162(y), r2=66(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 162
LDI r2, 66
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
