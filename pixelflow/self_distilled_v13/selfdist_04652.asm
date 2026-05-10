; DESCRIPTION: Places a magenta disk with center (367, 134) and radius 23.
; PLAN: r0=367(x), r1=134(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 134
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
