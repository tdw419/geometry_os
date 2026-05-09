; DESCRIPTION: Creates a black circular shape at (196, 27) with radius 22.
; PLAN: r0=196(x), r1=27(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 27
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
