; DESCRIPTION: Composite: Places a cyan dot at position (204, 210) then Draws a magenta line from (45, 235) to (468, 252).
; PLAN: r0=204(x), r1=210(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=235(y1), r7=468(x2), r8=252(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 210
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 235
LDI r7, 468
LDI r8, 252
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
