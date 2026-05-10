; DESCRIPTION: Creates a magenta circular shape at (345, 77) with radius 57.
; PLAN: r0=345(x), r1=77(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 77
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
