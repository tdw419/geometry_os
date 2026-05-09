; DESCRIPTION: Composite: Places a white line segment connecting (427, 175) to (172, 11) then Places a green dot at position (273, 229).
; PLAN: r0=427(x1), r1=175(y1), r2=172(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=229(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 175
LDI r2, 172
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 229
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
