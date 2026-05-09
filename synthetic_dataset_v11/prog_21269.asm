; DESCRIPTION: Composite: . Then Renders a black disk with center (201, 66) and radius 32. Then Places a green dot at position (94, 86).
; PLAN: r0=201(x), r1=66(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=94(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (201, 66) and radius 32.
; PLAN: r0=201(x), r1=66(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 66
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (94, 86).
; PLAN: r0=94(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
