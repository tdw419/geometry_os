; DESCRIPTION: Composite: . Then Sets a single green pixel at (140, 235). Then Renders a blue line between points (202, 240) and (141, 41).
; PLAN: r0=140(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=202(x1), r1=240(y1), r2=141(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (140, 235).
; PLAN: r0=140(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 235
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a blue line between points (202, 240) and (141, 41).
; PLAN: r0=202(x1), r1=240(y1), r2=141(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 240
LDI r2, 141
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
