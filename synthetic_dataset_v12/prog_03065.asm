; DESCRIPTION: Draws a magenta rectangle at (189, 156) with width 60 and height 91.
; PLAN: r0=189(x), r1=156(y), r2=60(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 156
LDI r2, 60
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
