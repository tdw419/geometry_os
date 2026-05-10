; DESCRIPTION: Places a magenta circle of radius 75 at center (303, 150).
; PLAN: r0=303(x), r1=150(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
