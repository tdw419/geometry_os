; DESCRIPTION: Places a magenta circle of radius 36 at center (193, 159).
; PLAN: r0=193(x), r1=159(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 159
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
