; DESCRIPTION: Creates a magenta circular shape at (25, 111) with radius 23.
; PLAN: r0=25(x), r1=111(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 111
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
