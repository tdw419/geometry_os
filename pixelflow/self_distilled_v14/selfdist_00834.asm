; DESCRIPTION: Places a yellow disk with center (208, 163) and radius 68.
; PLAN: r0=208(x), r1=163(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 163
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
