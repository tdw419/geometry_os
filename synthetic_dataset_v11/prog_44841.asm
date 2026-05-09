; DESCRIPTION: Draws a magenta rectangle at (66, 146) with width 73 and height 70.
; PLAN: r0=66(x), r1=146(y), r2=73(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 146
LDI r2, 73
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
