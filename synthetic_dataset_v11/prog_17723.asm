; DESCRIPTION: Composite: . Then Renders a yellow disk with center (15, 131) and radius 12. Then Places a red dot at position (253, 247).
; PLAN: r0=15(x), r1=131(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=253(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (15, 131) and radius 12.
; PLAN: r0=15(x), r1=131(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 131
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (253, 247).
; PLAN: r0=253(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
