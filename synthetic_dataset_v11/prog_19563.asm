; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (9, 167). Then Places a black line segment connecting (103, 213) to (79, 72).
; PLAN: r0=9(x), r1=167(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=103(x1), r1=213(y1), r2=79(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (9, 167).
; PLAN: r0=9(x), r1=167(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 167
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (103, 213) to (79, 72).
; PLAN: r0=103(x1), r1=213(y1), r2=79(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 213
LDI r2, 79
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
