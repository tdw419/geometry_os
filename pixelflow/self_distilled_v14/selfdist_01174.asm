; DESCRIPTION: Places a yellow disk with center (74, 112) and radius 62.
; PLAN: r0=74(x), r1=112(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 112
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
