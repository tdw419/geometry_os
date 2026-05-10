; DESCRIPTION: Places a red disk with center (238, 167) and radius 55.
; PLAN: r0=238(x), r1=167(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 167
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
