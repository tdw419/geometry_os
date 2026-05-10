; DESCRIPTION: Places a yellow disk with center (329, 171) and radius 12.
; PLAN: r0=329(x), r1=171(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 171
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
