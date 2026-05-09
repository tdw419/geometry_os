; DESCRIPTION: Creates a yellow circular shape at (106, 127) with radius 74.
; PLAN: r0=106(x), r1=127(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 127
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
