; DESCRIPTION: Creates a magenta circular shape at (72, 69) with radius 65.
; PLAN: r0=72(x), r1=69(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 69
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
