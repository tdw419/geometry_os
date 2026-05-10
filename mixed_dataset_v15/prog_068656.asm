; DESCRIPTION: Composite: Sets a single blue pixel at (409, 163) then Draws a purple line from (507, 145) to (129, 227).
; PLAN: r0=409(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=145(y1), r7=129(x2), r8=227(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 507
LDI r6, 145
LDI r7, 129
LDI r8, 227
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
