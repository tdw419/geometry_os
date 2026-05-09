; DESCRIPTION: Places a magenta circle of radius 56 at center (428, 171).
; PLAN: r0=428(x), r1=171(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 171
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
