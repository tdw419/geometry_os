; DESCRIPTION: Places a magenta circle of radius 51 at center (302, 188).
; PLAN: r0=302(x), r1=188(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 188
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
