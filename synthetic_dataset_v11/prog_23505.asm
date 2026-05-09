; DESCRIPTION: Composite: . Then Draws a red line from (52, 130) to (20, 204). Then Sets a single yellow pixel at (89, 235).
; PLAN: r0=52(x1), r1=130(y1), r2=20(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=89(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (52, 130) to (20, 204).
; PLAN: r0=52(x1), r1=130(y1), r2=20(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 130
LDI r2, 20
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (89, 235).
; PLAN: r0=89(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 235
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
