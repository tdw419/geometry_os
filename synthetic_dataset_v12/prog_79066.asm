; DESCRIPTION: Composite: Places a black dot at position (321, 124) then Places a purple line segment connecting (401, 66) to (302, 139).
; PLAN: r0=321(x), r1=124(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=66(y1), r7=302(x2), r8=139(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 124
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 401
LDI r6, 66
LDI r7, 302
LDI r8, 139
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
