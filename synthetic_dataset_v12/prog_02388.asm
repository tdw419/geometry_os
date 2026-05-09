; DESCRIPTION: Composite: Sets a single orange pixel at (72, 53) then Places a yellow line segment connecting (474, 117) to (391, 125).
; PLAN: r0=72(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=474(x1), r6=117(y1), r7=391(x2), r8=125(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 474
LDI r6, 117
LDI r7, 391
LDI r8, 125
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
