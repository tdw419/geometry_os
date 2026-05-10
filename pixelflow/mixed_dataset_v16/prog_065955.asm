; DESCRIPTION: Places a red disk with center (303, 100) and radius 27.
; PLAN: r0=303(x), r1=100(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 100
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
