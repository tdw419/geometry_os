; DESCRIPTION: Composite: Places a yellow line segment connecting (260, 244) to (451, 222) then Sets a single blue pixel at (297, 179).
; PLAN: r0=260(x1), r1=244(y1), r2=451(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=179(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 244
LDI r2, 451
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 179
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
