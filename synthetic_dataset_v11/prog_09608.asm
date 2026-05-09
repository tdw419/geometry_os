; DESCRIPTION: Composite: . Then Places a green circle of radius 37 at center (68, 182). Then Places a blue dot at position (226, 172).
; PLAN: r0=68(x), r1=182(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=226(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 37 at center (68, 182).
; PLAN: r0=68(x), r1=182(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 182
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (226, 172).
; PLAN: r0=226(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
