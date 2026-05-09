; DESCRIPTION: Composite: Sets a single blue pixel at (11, 156) then Draws a blue line from (85, 235) to (231, 103).
; PLAN: r0=11(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=85(x1), r6=235(y1), r7=231(x2), r8=103(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 235
LDI r7, 231
LDI r8, 103
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
