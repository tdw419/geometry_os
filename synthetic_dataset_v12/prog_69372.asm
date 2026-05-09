; DESCRIPTION: Composite: Places a yellow dot at position (277, 203) then Places a red line segment connecting (451, 141) to (217, 176).
; PLAN: r0=277(x), r1=203(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=451(x1), r6=141(y1), r7=217(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 203
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 451
LDI r6, 141
LDI r7, 217
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
