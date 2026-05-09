; DESCRIPTION: Composite: . Then Places a yellow dot at position (7, 181). Then Renders a cyan disk with center (90, 160) and radius 78.
; PLAN: r0=7(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=160(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (7, 181).
; PLAN: r0=7(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (90, 160) and radius 78.
; PLAN: r0=90(x), r1=160(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 160
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
