; DESCRIPTION: Composite: . Then Places a yellow dot at position (75, 23). Then Renders a purple disk with center (176, 174) and radius 10.
; PLAN: r0=75(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=176(x), r1=174(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (75, 23).
; PLAN: r0=75(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (176, 174) and radius 10.
; PLAN: r0=176(x), r1=174(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 174
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
