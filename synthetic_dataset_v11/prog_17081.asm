; DESCRIPTION: Composite: . Then Renders a white disk with center (220, 123) and radius 19. Then Places a white dot at position (195, 119).
; PLAN: r0=220(x), r1=123(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=195(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (220, 123) and radius 19.
; PLAN: r0=220(x), r1=123(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 123
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (195, 119).
; PLAN: r0=195(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
