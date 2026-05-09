; DESCRIPTION: Creates a magenta circular shape at (207, 202) with radius 19.
; PLAN: r0=207(x), r1=202(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 202
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
