; DESCRIPTION: Draws a magenta rectangle at (2, 153) with width 113 and height 91.
; PLAN: r0=2(x), r1=153(y), r2=113(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 153
LDI r2, 113
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
