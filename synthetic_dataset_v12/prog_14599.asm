; DESCRIPTION: Creates a magenta circular shape at (317, 103) with radius 15.
; PLAN: r0=317(x), r1=103(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 103
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
