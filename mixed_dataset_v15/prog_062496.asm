; DESCRIPTION: Composite: Places a magenta dot at position (177, 134) then Draws a cyan line from (505, 118) to (227, 56).
; PLAN: r0=177(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=118(y1), r7=227(x2), r8=56(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 505
LDI r6, 118
LDI r7, 227
LDI r8, 56
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
