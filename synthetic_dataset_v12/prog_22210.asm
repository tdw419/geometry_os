; DESCRIPTION: Places a black circle of radius 35 at center (96, 192).
; PLAN: r0=96(x), r1=192(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 192
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
