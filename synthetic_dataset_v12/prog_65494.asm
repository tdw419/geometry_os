; DESCRIPTION: Draws a magenta rectangle at (91, 174) with width 74 and height 72.
; PLAN: r0=91(x), r1=174(y), r2=74(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 174
LDI r2, 74
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
