; DESCRIPTION: Composite: . Then Draws a green line from (183, 19) to (41, 175). Then Sets a single green pixel at (155, 219).
; PLAN: r0=183(x1), r1=19(y1), r2=41(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=219(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green line from (183, 19) to (41, 175).
; PLAN: r0=183(x1), r1=19(y1), r2=41(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 19
LDI r2, 41
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (155, 219).
; PLAN: r0=155(x), r1=219(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 219
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
