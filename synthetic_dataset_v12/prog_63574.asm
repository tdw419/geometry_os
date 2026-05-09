; DESCRIPTION: Creates a yellow circular shape at (146, 81) with radius 22.
; PLAN: r0=146(x), r1=81(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 81
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
