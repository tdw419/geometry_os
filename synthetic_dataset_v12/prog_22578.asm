; DESCRIPTION: Composite: Sets a single red pixel at (393, 55) then Places a white line segment connecting (139, 39) to (353, 45).
; PLAN: r0=393(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=39(y1), r7=353(x2), r8=45(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 139
LDI r6, 39
LDI r7, 353
LDI r8, 45
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
