; DESCRIPTION: Composite: Places a green line segment connecting (34, 47) to (370, 97) then Sets a single orange pixel at (371, 141).
; PLAN: r0=34(x1), r1=47(y1), r2=370(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=141(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 47
LDI r2, 370
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 141
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
