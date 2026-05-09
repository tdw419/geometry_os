; DESCRIPTION: Creates a magenta circular shape at (84, 166) with radius 35.
; PLAN: r0=84(x), r1=166(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 166
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
