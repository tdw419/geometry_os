; DESCRIPTION: Composite: . Then Renders a orange disk with center (129, 197) and radius 52. Then Places a white dot at position (91, 30).
; PLAN: r0=129(x), r1=197(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=91(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (129, 197) and radius 52.
; PLAN: r0=129(x), r1=197(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 197
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (91, 30).
; PLAN: r0=91(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
