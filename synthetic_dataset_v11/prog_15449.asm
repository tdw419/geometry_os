; DESCRIPTION: Composite: . Then Places a red circle of radius 17 at center (170, 101). Then Sets a single green pixel at (127, 215).
; PLAN: r0=170(x), r1=101(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 17 at center (170, 101).
; PLAN: r0=170(x), r1=101(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 101
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (127, 215).
; PLAN: r0=127(x), r1=215(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 215
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
