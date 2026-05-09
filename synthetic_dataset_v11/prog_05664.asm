; DESCRIPTION: Composite: . Then Places a blue dot at position (186, 45). Then Renders a white disk with center (108, 104) and radius 25.
; PLAN: r0=186(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=104(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (186, 45).
; PLAN: r0=186(x), r1=45(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 45
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (108, 104) and radius 25.
; PLAN: r0=108(x), r1=104(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 104
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
