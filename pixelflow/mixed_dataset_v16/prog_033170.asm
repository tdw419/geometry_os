; DESCRIPTION: Places a magenta circle of radius 54 at center (317, 195).
; PLAN: r0=317(x), r1=195(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 195
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
