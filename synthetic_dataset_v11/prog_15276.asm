; DESCRIPTION: Creates a magenta circular shape at (182, 141) with radius 26.
; PLAN: r0=182(x), r1=141(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 141
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
