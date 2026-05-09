; DESCRIPTION: Composite: . Then Renders a orange disk with center (177, 160) and radius 63. Then Places a blue dot at position (131, 198).
; PLAN: r0=177(x), r1=160(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=131(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (177, 160) and radius 63.
; PLAN: r0=177(x), r1=160(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 160
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (131, 198).
; PLAN: r0=131(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
