; DESCRIPTION: Composite: Places a black dot at position (372, 5) then Places a red line segment connecting (9, 188) to (29, 200).
; PLAN: r0=372(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=9(x1), r6=188(y1), r7=29(x2), r8=200(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 9
LDI r6, 188
LDI r7, 29
LDI r8, 200
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
