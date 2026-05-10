; DESCRIPTION: Places a magenta disk with center (70, 29) and radius 77.
; PLAN: r0=70(x), r1=29(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 29
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
