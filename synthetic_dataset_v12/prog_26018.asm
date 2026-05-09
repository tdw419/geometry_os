; DESCRIPTION: Creates a magenta circular shape at (396, 125) with radius 65.
; PLAN: r0=396(x), r1=125(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 125
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
