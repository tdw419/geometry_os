; DESCRIPTION: Creates a magenta circular shape at (322, 122) with radius 31.
; PLAN: r0=322(x), r1=122(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 122
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
