; DESCRIPTION: Composite: Places a cyan line segment connecting (198, 140) to (473, 34) then Sets a single blue pixel at (323, 236).
; PLAN: r0=198(x1), r1=140(y1), r2=473(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=236(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 140
LDI r2, 473
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 236
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
