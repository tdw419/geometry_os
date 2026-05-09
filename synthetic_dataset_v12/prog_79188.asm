; DESCRIPTION: Creates a magenta circular shape at (70, 131) with radius 47.
; PLAN: r0=70(x), r1=131(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 131
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
