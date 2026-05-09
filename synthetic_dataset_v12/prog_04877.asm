; DESCRIPTION: Composite: Places a cyan line segment connecting (302, 22) to (339, 145) then Places a red dot at position (407, 221).
; PLAN: r0=302(x1), r1=22(y1), r2=339(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=221(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 302
LDI r1, 22
LDI r2, 339
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 221
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
