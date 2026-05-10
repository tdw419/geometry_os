; DESCRIPTION: Draws a magenta rectangle at (165, 37) with width 71 and height 91.
; PLAN: r0=165(x), r1=37(y), r2=71(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 37
LDI r2, 71
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
