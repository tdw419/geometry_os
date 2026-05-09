; DESCRIPTION: Places a magenta circle of radius 55 at center (208, 57).
; PLAN: r0=208(x), r1=57(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 57
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
