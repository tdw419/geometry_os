; DESCRIPTION: Composite: . Then Creates a orange circular shape at (170, 137) with radius 76. Then Places a cyan dot at position (66, 187).
; PLAN: r0=170(x), r1=137(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (170, 137) with radius 76.
; PLAN: r0=170(x), r1=137(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 137
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (66, 187).
; PLAN: r0=66(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
