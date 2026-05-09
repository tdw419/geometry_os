; DESCRIPTION: Composite: . Then Places a red dot at position (50, 40). Then Renders a red disk with center (179, 85) and radius 51.
; PLAN: r0=50(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=179(x), r1=85(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (50, 40).
; PLAN: r0=50(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (179, 85) and radius 51.
; PLAN: r0=179(x), r1=85(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 85
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
