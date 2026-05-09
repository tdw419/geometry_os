; DESCRIPTION: Composite: . Then Sets a single blue pixel at (70, 53). Then Draws a yellow line from (140, 251) to (24, 41).
; PLAN: r0=70(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=140(x1), r1=251(y1), r2=24(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (70, 53).
; PLAN: r0=70(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (140, 251) to (24, 41).
; PLAN: r0=140(x1), r1=251(y1), r2=24(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 251
LDI r2, 24
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
