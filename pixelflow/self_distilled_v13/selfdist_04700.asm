; DESCRIPTION: Places a magenta disk with center (80, 138) and radius 40.
; PLAN: r0=80(x), r1=138(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 138
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
