; DESCRIPTION: Composite: . Then Places a white circle of radius 41 at center (120, 63). Then Places a purple dot at position (179, 196).
; PLAN: r0=120(x), r1=63(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=179(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 41 at center (120, 63).
; PLAN: r0=120(x), r1=63(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 63
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (179, 196).
; PLAN: r0=179(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 196
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
