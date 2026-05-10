; DESCRIPTION: Places a magenta circle of radius 51 at center (248, 186).
; PLAN: r0=248(x), r1=186(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 186
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
