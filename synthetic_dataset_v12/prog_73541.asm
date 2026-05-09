; DESCRIPTION: Draws a magenta rectangle at (329, 69) with width 26 and height 115.
; PLAN: r0=329(x), r1=69(y), r2=26(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 69
LDI r2, 26
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
