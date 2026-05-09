; DESCRIPTION: Composite: . Then Renders a yellow disk with center (108, 157) and radius 78. Then Places a cyan dot at position (166, 61).
; PLAN: r0=108(x), r1=157(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=166(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (108, 157) and radius 78.
; PLAN: r0=108(x), r1=157(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 157
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (166, 61).
; PLAN: r0=166(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
