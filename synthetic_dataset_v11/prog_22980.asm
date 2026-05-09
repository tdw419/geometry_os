; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (192, 230). Then Draws a blue line from (36, 98) to (77, 41).
; PLAN: r0=192(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=36(x1), r1=98(y1), r2=77(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (192, 230).
; PLAN: r0=192(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (36, 98) to (77, 41).
; PLAN: r0=36(x1), r1=98(y1), r2=77(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 98
LDI r2, 77
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
