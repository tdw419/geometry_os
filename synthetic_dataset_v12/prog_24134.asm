; DESCRIPTION: Places a magenta circle of radius 13 at center (55, 208).
; PLAN: r0=55(x), r1=208(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 208
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
