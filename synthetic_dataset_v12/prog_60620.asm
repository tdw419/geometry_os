; DESCRIPTION: Creates a magenta circular shape at (322, 145) with radius 36.
; PLAN: r0=322(x), r1=145(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 145
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
