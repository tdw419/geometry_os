; DESCRIPTION: Creates a magenta circular shape at (226, 58) with radius 18.
; PLAN: r0=226(x), r1=58(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 58
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
