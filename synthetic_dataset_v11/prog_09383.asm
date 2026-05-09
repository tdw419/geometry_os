; DESCRIPTION: Composite: . Then Renders a black disk with center (140, 218) and radius 30. Then Places a cyan dot at position (20, 88).
; PLAN: r0=140(x), r1=218(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=88(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (140, 218) and radius 30.
; PLAN: r0=140(x), r1=218(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 218
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (20, 88).
; PLAN: r0=20(x), r1=88(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 88
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
