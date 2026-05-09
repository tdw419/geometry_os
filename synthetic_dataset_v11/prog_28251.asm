; DESCRIPTION: Composite: . Then Places a yellow dot at position (88, 221). Then Renders a red disk with center (84, 197) and radius 51.
; PLAN: r0=88(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=84(x), r1=197(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (88, 221).
; PLAN: r0=88(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (84, 197) and radius 51.
; PLAN: r0=84(x), r1=197(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 197
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
