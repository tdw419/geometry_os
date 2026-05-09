; DESCRIPTION: Draws a magenta rectangle at (290, 53) with width 101 and height 18.
; PLAN: r0=290(x), r1=53(y), r2=101(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 53
LDI r2, 101
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
