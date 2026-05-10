; DESCRIPTION: Composite: Places a white line segment connecting (427, 2) to (182, 204) then Places a cyan dot at position (68, 109).
; PLAN: r0=427(x1), r1=2(y1), r2=182(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 2
LDI r2, 182
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
