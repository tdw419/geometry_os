; DESCRIPTION: Composite: . Then Places a cyan dot at position (5, 162). Then Renders a white disk with center (130, 80) and radius 77.
; PLAN: r0=5(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=130(x), r1=80(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (5, 162).
; PLAN: r0=5(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (130, 80) and radius 77.
; PLAN: r0=130(x), r1=80(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 80
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
