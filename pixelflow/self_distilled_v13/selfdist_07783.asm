; DESCRIPTION: Places a yellow disk with center (60, 185) and radius 52.
; PLAN: r0=60(x), r1=185(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 185
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
