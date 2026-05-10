; DESCRIPTION: Creates a magenta circular shape at (393, 69) with radius 63.
; PLAN: r0=393(x), r1=69(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 69
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
