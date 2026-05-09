; DESCRIPTION: Places a magenta circle of radius 55 at center (113, 110).
; PLAN: r0=113(x), r1=110(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 110
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
