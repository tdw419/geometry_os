; DESCRIPTION: Composite: Places a purple dot at position (133, 235) then Places a blue line segment connecting (281, 109) to (162, 155).
; PLAN: r0=133(x), r1=235(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=281(x1), r6=109(y1), r7=162(x2), r8=155(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 235
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 281
LDI r6, 109
LDI r7, 162
LDI r8, 155
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
