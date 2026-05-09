; DESCRIPTION: Creates a magenta circular shape at (286, 161) with radius 58.
; PLAN: r0=286(x), r1=161(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 161
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
