; DESCRIPTION: Places a magenta disk with center (372, 100) and radius 71.
; PLAN: r0=372(x), r1=100(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 100
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
