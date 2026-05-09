; DESCRIPTION: Places a magenta circle of radius 80 at center (151, 169).
; PLAN: r0=151(x), r1=169(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 169
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
