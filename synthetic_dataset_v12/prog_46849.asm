; DESCRIPTION: Creates a black circular shape at (196, 127) with radius 52.
; PLAN: r0=196(x), r1=127(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 127
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
