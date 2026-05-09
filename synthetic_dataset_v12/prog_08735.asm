; DESCRIPTION: Places a magenta circle of radius 10 at center (185, 90).
; PLAN: r0=185(x), r1=90(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 90
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
