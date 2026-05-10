; DESCRIPTION: Creates a magenta circular shape at (292, 87) with radius 17.
; PLAN: r0=292(x), r1=87(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 87
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
