; DESCRIPTION: Composite: . Then Sets a single green pixel at (249, 230). Then Places a black line segment connecting (30, 138) to (37, 91).
; PLAN: r0=249(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=30(x1), r1=138(y1), r2=37(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (249, 230).
; PLAN: r0=249(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (30, 138) to (37, 91).
; PLAN: r0=30(x1), r1=138(y1), r2=37(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 138
LDI r2, 37
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
