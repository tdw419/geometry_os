; DESCRIPTION: Composite: Places a cyan dot at position (265, 185) then Places a green line segment connecting (355, 31) to (23, 107).
; PLAN: r0=265(x), r1=185(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=355(x1), r6=31(y1), r7=23(x2), r8=107(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 185
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 31
LDI r7, 23
LDI r8, 107
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
