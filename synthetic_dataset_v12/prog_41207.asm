; DESCRIPTION: Composite: Places a black line segment connecting (437, 29) to (489, 177) then Places a black dot at position (105, 177).
; PLAN: r0=437(x1), r1=29(y1), r2=489(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 29
LDI r2, 489
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
HALT
