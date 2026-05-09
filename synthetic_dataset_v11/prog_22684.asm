; DESCRIPTION: Composite: . Then Sets a single green pixel at (189, 9). Then Renders a black line between points (216, 46) and (240, 142).
; PLAN: r0=189(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=216(x1), r1=46(y1), r2=240(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (189, 9).
; PLAN: r0=189(x), r1=9(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 9
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black line between points (216, 46) and (240, 142).
; PLAN: r0=216(x1), r1=46(y1), r2=240(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 46
LDI r2, 240
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
