; DESCRIPTION: Creates a magenta circular shape at (199, 132) with radius 51.
; PLAN: r0=199(x), r1=132(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 132
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
