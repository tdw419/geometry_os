; DESCRIPTION: Composite: . Then Places a green dot at position (223, 175). Then Renders a cyan disk with center (105, 98) and radius 30.
; PLAN: r0=223(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=105(x), r1=98(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (223, 175).
; PLAN: r0=223(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (105, 98) and radius 30.
; PLAN: r0=105(x), r1=98(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 98
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
