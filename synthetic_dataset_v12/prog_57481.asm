; DESCRIPTION: Places a magenta circle of radius 75 at center (193, 153).
; PLAN: r0=193(x), r1=153(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 153
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
