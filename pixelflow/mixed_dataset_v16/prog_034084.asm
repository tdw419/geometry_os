; DESCRIPTION: Composite: Renders a green line between points (483, 25) and (485, 202) then Sets a single yellow pixel at (391, 0).
; PLAN: r0=483(x1), r1=25(y1), r2=485(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=0(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 483
LDI r1, 25
LDI r2, 485
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 0
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
