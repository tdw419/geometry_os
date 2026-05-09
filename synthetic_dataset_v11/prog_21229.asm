; DESCRIPTION: Composite: . Then Places a cyan dot at position (51, 58). Then Renders a white line between points (5, 224) and (224, 199).
; PLAN: r0=51(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=5(x1), r1=224(y1), r2=224(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (51, 58).
; PLAN: r0=51(x), r1=58(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 58
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (5, 224) and (224, 199).
; PLAN: r0=5(x1), r1=224(y1), r2=224(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 224
LDI r2, 224
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
