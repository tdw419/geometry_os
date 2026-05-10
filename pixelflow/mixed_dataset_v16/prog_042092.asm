; DESCRIPTION: Composite: Sets a single green pixel at (330, 149) then Renders a black line between points (269, 207) and (87, 9).
; PLAN: r0=330(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=207(y1), r7=87(x2), r8=9(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 269
LDI r6, 207
LDI r7, 87
LDI r8, 9
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
