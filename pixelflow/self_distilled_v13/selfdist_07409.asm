; DESCRIPTION: Places a magenta disk with center (313, 77) and radius 39.
; PLAN: r0=313(x), r1=77(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 77
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
