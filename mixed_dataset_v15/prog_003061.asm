; DESCRIPTION: Places a yellow disk with center (228, 174) and radius 20.
; PLAN: r0=228(x), r1=174(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 174
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
