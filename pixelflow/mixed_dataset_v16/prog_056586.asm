; DESCRIPTION: Composite: Places a cyan line segment connecting (326, 230) to (508, 9) then Sets a single purple pixel at (88, 24).
; PLAN: r0=326(x1), r1=230(y1), r2=508(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=24(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 230
LDI r2, 508
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 24
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
