; DESCRIPTION: Places a black circle of radius 34 at center (412, 187).
; PLAN: r0=412(x), r1=187(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 187
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
