; DESCRIPTION: Composite: . Then Places a white dot at position (208, 203). Then Places a red circle of radius 75 at center (129, 138).
; PLAN: r0=208(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=129(x), r1=138(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (208, 203).
; PLAN: r0=208(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 75 at center (129, 138).
; PLAN: r0=129(x), r1=138(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 138
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
