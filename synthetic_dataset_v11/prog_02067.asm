; DESCRIPTION: Creates a magenta circular shape at (69, 65) with radius 61.
; PLAN: r0=69(x), r1=65(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 65
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
