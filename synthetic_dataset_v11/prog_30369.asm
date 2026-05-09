; DESCRIPTION: Composite: . Then Places a black dot at position (3, 214). Then Places a yellow circle of radius 29 at center (176, 120).
; PLAN: r0=3(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=176(x), r1=120(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (3, 214).
; PLAN: r0=3(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 29 at center (176, 120).
; PLAN: r0=176(x), r1=120(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 120
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
