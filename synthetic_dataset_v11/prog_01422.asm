; DESCRIPTION: Composite: . Then Places a red dot at position (202, 156). Then Renders a white disk with center (118, 220) and radius 18.
; PLAN: r0=202(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=118(x), r1=220(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (202, 156).
; PLAN: r0=202(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (118, 220) and radius 18.
; PLAN: r0=118(x), r1=220(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 220
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
