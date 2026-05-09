; DESCRIPTION: Composite: Places a orange line segment connecting (178, 121) to (126, 122) then Sets a single green pixel at (437, 20).
; PLAN: r0=178(x1), r1=121(y1), r2=126(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 121
LDI r2, 126
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
