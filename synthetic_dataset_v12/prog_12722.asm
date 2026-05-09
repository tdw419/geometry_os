; DESCRIPTION: Creates a magenta circular shape at (385, 188) with radius 47.
; PLAN: r0=385(x), r1=188(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 188
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
