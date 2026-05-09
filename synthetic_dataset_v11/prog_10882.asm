; DESCRIPTION: Places a yellow circle of radius 43 at center (101, 192).
; PLAN: r0=101(x), r1=192(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 192
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
