; DESCRIPTION: Composite: . Then Places a black circle of radius 34 at center (115, 164). Then Places a orange dot at position (202, 137).
; PLAN: r0=115(x), r1=164(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=202(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 34 at center (115, 164).
; PLAN: r0=115(x), r1=164(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 164
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (202, 137).
; PLAN: r0=202(x), r1=137(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 137
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
