; DESCRIPTION: Composite: . Then Places a cyan dot at position (181, 155). Then Renders a yellow disk with center (57, 89) and radius 16.
; PLAN: r0=181(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=57(x), r1=89(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (181, 155).
; PLAN: r0=181(x), r1=155(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 155
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (57, 89) and radius 16.
; PLAN: r0=57(x), r1=89(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 89
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
