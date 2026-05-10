; DESCRIPTION: Places a red disk with center (140, 174) and radius 20.
; PLAN: r0=140(x), r1=174(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 174
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
