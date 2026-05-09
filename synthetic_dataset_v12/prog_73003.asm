; DESCRIPTION: Places a magenta circle of radius 65 at center (350, 89).
; PLAN: r0=350(x), r1=89(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 89
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
