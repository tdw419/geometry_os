; DESCRIPTION: Places a red disk with center (162, 171) and radius 49.
; PLAN: r0=162(x), r1=171(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 171
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
