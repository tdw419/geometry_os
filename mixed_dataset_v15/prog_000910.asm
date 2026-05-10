; DESCRIPTION: Composite: Places a green line segment connecting (508, 216) to (244, 87) then Sets a single green pixel at (215, 206).
; PLAN: r0=508(x1), r1=216(y1), r2=244(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=206(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 508
LDI r1, 216
LDI r2, 244
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 206
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
