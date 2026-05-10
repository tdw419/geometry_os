; DESCRIPTION: Creates a magenta circular shape at (120, 166) with radius 74.
; PLAN: r0=120(x), r1=166(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 166
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
