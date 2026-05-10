; DESCRIPTION: Creates a magenta circular shape at (248, 37) with radius 17.
; PLAN: r0=248(x), r1=37(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 37
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
