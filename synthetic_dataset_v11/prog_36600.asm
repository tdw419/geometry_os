; DESCRIPTION: Places a magenta circle of radius 57 at center (189, 103).
; PLAN: r0=189(x), r1=103(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 103
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
