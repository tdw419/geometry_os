; DESCRIPTION: Creates a magenta circular shape at (131, 160) with radius 12.
; PLAN: r0=131(x), r1=160(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 160
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
