; DESCRIPTION: Places a magenta disk with center (322, 155) and radius 72.
; PLAN: r0=322(x), r1=155(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 155
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
