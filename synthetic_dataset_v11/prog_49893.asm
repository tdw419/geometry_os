; DESCRIPTION: Composite: . Then Places a cyan dot at position (41, 11). Then Creates a orange circular shape at (209, 159) with radius 40.
; PLAN: r0=41(x), r1=11(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=209(x), r1=159(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (41, 11).
; PLAN: r0=41(x), r1=11(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 11
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (209, 159) with radius 40.
; PLAN: r0=209(x), r1=159(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 159
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
