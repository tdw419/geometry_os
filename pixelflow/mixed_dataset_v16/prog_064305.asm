; DESCRIPTION: Creates a yellow circular shape at (345, 153) with radius 27.
; PLAN: r0=345(x), r1=153(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 153
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
