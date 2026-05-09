; DESCRIPTION: Places a magenta circle of radius 33 at center (349, 164).
; PLAN: r0=349(x), r1=164(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 164
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
