; DESCRIPTION: Draws a magenta rectangle at (103, 142) with width 31 and height 35.
; PLAN: r0=103(x), r1=142(y), r2=31(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 142
LDI r2, 31
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
