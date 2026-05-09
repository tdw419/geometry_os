; DESCRIPTION: Places a magenta circle of radius 33 at center (313, 190).
; PLAN: r0=313(x), r1=190(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 190
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
