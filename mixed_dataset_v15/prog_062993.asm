; DESCRIPTION: Composite: Places a white dot at position (191, 37) then Places a red line segment connecting (35, 236) to (324, 104).
; PLAN: r0=191(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=236(y1), r7=324(x2), r8=104(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 191
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 236
LDI r7, 324
LDI r8, 104
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
