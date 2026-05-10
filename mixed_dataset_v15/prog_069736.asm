; DESCRIPTION: Composite: Places a green line segment connecting (122, 191) to (126, 43) then Sets a single cyan pixel at (178, 38).
; PLAN: r0=122(x1), r1=191(y1), r2=126(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=38(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 191
LDI r2, 126
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 38
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
