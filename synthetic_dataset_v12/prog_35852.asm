; DESCRIPTION: Composite: Places a orange dot at position (135, 15) then Renders a orange line between points (37, 25) and (235, 129).
; PLAN: r0=135(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=25(y1), r7=235(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 37
LDI r6, 25
LDI r7, 235
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
