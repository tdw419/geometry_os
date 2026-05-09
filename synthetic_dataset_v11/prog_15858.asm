; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (97, 97) to (7, 214). Then Sets a single green pixel at (170, 107).
; PLAN: r0=97(x1), r1=97(y1), r2=7(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (97, 97) to (7, 214).
; PLAN: r0=97(x1), r1=97(y1), r2=7(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 97
LDI r2, 7
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (170, 107).
; PLAN: r0=170(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
