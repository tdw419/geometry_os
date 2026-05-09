; DESCRIPTION: Composite: . Then Renders a blue disk with center (126, 97) and radius 70. Then Places a blue dot at position (68, 20).
; PLAN: r0=126(x), r1=97(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=68(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (126, 97) and radius 70.
; PLAN: r0=126(x), r1=97(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 97
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (68, 20).
; PLAN: r0=68(x), r1=20(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 20
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
