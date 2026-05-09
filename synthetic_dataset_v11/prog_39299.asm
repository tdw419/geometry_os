; DESCRIPTION: Places a black circle of radius 33 at center (161, 167).
; PLAN: r0=161(x), r1=167(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 167
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
