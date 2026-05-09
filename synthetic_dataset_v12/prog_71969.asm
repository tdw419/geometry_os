; DESCRIPTION: Composite: Places a green line segment connecting (350, 51) to (217, 73) then Sets a single black pixel at (479, 118).
; PLAN: r0=350(x1), r1=51(y1), r2=217(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=118(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 350
LDI r1, 51
LDI r2, 217
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 118
LDI r7, 0x000000
PSET r5, r6, r7
HALT
