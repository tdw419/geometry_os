; DESCRIPTION: Composite: . Then Creates a white circular shape at (76, 208) with radius 45. Then Places a red dot at position (87, 238).
; PLAN: r0=76(x), r1=208(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a white circular shape at (76, 208) with radius 45.
; PLAN: r0=76(x), r1=208(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 208
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (87, 238).
; PLAN: r0=87(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
