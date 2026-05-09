; DESCRIPTION: Creates a yellow circular shape at (77, 73) with radius 27.
; PLAN: r0=77(x), r1=73(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 73
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
