; DESCRIPTION: Creates a magenta circular shape at (319, 208) with radius 17.
; PLAN: r0=319(x), r1=208(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 208
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
