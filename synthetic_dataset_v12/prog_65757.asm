; DESCRIPTION: Creates a magenta circular shape at (461, 46) with radius 12.
; PLAN: r0=461(x), r1=46(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 46
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
