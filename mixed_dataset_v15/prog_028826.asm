; DESCRIPTION: Places a red disk with center (102, 200) and radius 40.
; PLAN: r0=102(x), r1=200(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 200
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
