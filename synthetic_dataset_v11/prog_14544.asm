; DESCRIPTION: Places a magenta circle of radius 36 at center (189, 172).
; PLAN: r0=189(x), r1=172(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 172
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
