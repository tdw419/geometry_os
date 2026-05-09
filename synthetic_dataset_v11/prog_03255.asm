; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (145, 225). Then Draws a green line from (230, 245) to (160, 114).
; PLAN: r0=145(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=230(x1), r1=245(y1), r2=160(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (145, 225).
; PLAN: r0=145(x), r1=225(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 225
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (230, 245) to (160, 114).
; PLAN: r0=230(x1), r1=245(y1), r2=160(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 245
LDI r2, 160
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
