; DESCRIPTION: Draws a magenta rectangle at (100, 201) with width 70 and height 53.
; PLAN: r0=100(x), r1=201(y), r2=70(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 201
LDI r2, 70
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
