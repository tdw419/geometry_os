; DESCRIPTION: Places a black circle of radius 47 at center (311, 143).
; PLAN: r0=311(x), r1=143(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 143
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
