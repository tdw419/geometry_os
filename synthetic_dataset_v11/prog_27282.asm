; DESCRIPTION: Draws a magenta rectangle at (157, 146) with width 58 and height 44.
; PLAN: r0=157(x), r1=146(y), r2=58(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 146
LDI r2, 58
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
