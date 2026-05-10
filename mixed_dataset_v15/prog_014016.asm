; DESCRIPTION: Places a yellow disk with center (120, 167) and radius 66.
; PLAN: r0=120(x), r1=167(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 167
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
