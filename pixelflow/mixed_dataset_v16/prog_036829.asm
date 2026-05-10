; DESCRIPTION: Creates a green circular shape at (112, 146) with radius 31.
; PLAN: r0=112(x), r1=146(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 146
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
