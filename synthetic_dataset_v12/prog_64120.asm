; DESCRIPTION: Places a magenta circle of radius 48 at center (149, 57).
; PLAN: r0=149(x), r1=57(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 57
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
