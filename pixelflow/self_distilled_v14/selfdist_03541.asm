; DESCRIPTION: Places a yellow disk with center (105, 125) and radius 14.
; PLAN: r0=105(x), r1=125(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 125
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
