; DESCRIPTION: Composite: . Then Renders a blue disk with center (177, 170) and radius 15. Then Places a green dot at position (107, 174).
; PLAN: r0=177(x), r1=170(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=107(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (177, 170) and radius 15.
; PLAN: r0=177(x), r1=170(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 170
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green dot at position (107, 174).
; PLAN: r0=107(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 174
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
