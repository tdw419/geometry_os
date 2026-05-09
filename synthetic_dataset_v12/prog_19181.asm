; DESCRIPTION: Places a magenta circle of radius 51 at center (441, 187).
; PLAN: r0=441(x), r1=187(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 187
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
