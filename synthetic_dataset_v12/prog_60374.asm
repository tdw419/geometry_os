; DESCRIPTION: Places a magenta circle of radius 75 at center (400, 166).
; PLAN: r0=400(x), r1=166(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 166
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
