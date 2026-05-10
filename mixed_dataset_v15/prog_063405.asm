; DESCRIPTION: Composite: Places a black dot at position (66, 107) then Draws a orange line from (279, 179) to (137, 166).
; PLAN: r0=66(x), r1=107(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=179(y1), r7=137(x2), r8=166(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 107
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 279
LDI r6, 179
LDI r7, 137
LDI r8, 166
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
