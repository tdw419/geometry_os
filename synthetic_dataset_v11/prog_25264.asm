; DESCRIPTION: Composite: . Then Renders a black disk with center (192, 57) and radius 50. Then Places a red dot at position (51, 125).
; PLAN: r0=192(x), r1=57(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=51(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (192, 57) and radius 50.
; PLAN: r0=192(x), r1=57(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 57
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (51, 125).
; PLAN: r0=51(x), r1=125(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 125
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
