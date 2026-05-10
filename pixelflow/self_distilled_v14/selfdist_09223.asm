; DESCRIPTION: Places a magenta disk with center (106, 101) and radius 77.
; PLAN: r0=106(x), r1=101(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 101
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
