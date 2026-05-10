; DESCRIPTION: Draws a magenta rectangle at (91, 103) with width 64 and height 66.
; PLAN: r0=91(x), r1=103(y), r2=64(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 103
LDI r2, 64
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
