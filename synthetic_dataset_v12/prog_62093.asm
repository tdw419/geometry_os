; DESCRIPTION: Creates a magenta circular shape at (264, 106) with radius 57.
; PLAN: r0=264(x), r1=106(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 106
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
