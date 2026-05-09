; DESCRIPTION: Composite: Places a white dot at position (374, 112) then Renders a blue line between points (483, 167) and (457, 89).
; PLAN: r0=374(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=167(y1), r7=457(x2), r8=89(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 483
LDI r6, 167
LDI r7, 457
LDI r8, 89
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
