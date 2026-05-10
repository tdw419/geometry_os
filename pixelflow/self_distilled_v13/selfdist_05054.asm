; DESCRIPTION: Places a yellow disk with center (91, 174) and radius 24.
; PLAN: r0=91(x), r1=174(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 174
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
