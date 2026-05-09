; DESCRIPTION: Composite: Places a purple line segment connecting (335, 120) to (342, 68) then Places a blue dot at position (317, 145).
; PLAN: r0=335(x1), r1=120(y1), r2=342(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=145(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 120
LDI r2, 342
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 145
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
