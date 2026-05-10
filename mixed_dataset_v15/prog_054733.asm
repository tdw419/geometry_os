; DESCRIPTION: Creates a magenta circular shape at (464, 51) with radius 29.
; PLAN: r0=464(x), r1=51(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 51
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
