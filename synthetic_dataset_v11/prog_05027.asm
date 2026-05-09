; DESCRIPTION: Creates a green circular shape at (96, 146) with radius 58.
; PLAN: r0=96(x), r1=146(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 146
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
