; DESCRIPTION: Creates a magenta circular shape at (87, 112) with radius 55.
; PLAN: r0=87(x), r1=112(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 112
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
