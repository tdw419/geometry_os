; DESCRIPTION: Composite: . Then Places a green dot at position (182, 86). Then Renders a red disk with center (93, 199) and radius 37.
; PLAN: r0=182(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=199(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (182, 86).
; PLAN: r0=182(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (93, 199) and radius 37.
; PLAN: r0=93(x), r1=199(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 199
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
