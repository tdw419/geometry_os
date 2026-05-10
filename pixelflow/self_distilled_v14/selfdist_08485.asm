; DESCRIPTION: Places a magenta disk with center (25, 77) and radius 33.
; PLAN: r0=25(x), r1=77(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 77
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
