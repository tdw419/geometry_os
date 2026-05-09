; DESCRIPTION: Composite: . Then Renders a green line between points (89, 227) and (159, 225). Then Sets a single cyan pixel at (170, 161).
; PLAN: r0=89(x1), r1=227(y1), r2=159(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green line between points (89, 227) and (159, 225).
; PLAN: r0=89(x1), r1=227(y1), r2=159(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 227
LDI r2, 159
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (170, 161).
; PLAN: r0=170(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
