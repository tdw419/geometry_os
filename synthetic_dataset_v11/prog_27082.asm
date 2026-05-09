; DESCRIPTION: Composite: . Then Places a yellow dot at position (214, 144). Then Renders a cyan disk with center (185, 151) and radius 37.
; PLAN: r0=214(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=185(x), r1=151(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (214, 144).
; PLAN: r0=214(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (185, 151) and radius 37.
; PLAN: r0=185(x), r1=151(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 151
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
