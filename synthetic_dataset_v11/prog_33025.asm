; DESCRIPTION: Creates a magenta circular shape at (208, 96) with radius 17.
; PLAN: r0=208(x), r1=96(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 96
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
