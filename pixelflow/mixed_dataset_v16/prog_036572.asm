; DESCRIPTION: Composite: Places a black dot at position (399, 161) then Places a yellow line segment connecting (314, 218) to (207, 186).
; PLAN: r0=399(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=218(y1), r7=207(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 218
LDI r7, 207
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
