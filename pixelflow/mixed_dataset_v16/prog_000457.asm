; DESCRIPTION: Composite: Sets a single black pixel at (462, 124) then Places a red line segment connecting (511, 20) to (455, 33).
; PLAN: r0=462(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=511(x1), r6=20(y1), r7=455(x2), r8=33(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 124
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 511
LDI r6, 20
LDI r7, 455
LDI r8, 33
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
