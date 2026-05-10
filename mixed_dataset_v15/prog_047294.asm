; DESCRIPTION: Creates a magenta circular shape at (129, 187) with radius 46.
; PLAN: r0=129(x), r1=187(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 187
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
