; DESCRIPTION: Composite: Draws a orange line from (44, 114) to (25, 4) then Places a green dot at position (31, 177).
; PLAN: r0=44(x1), r1=114(y1), r2=25(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=177(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 114
LDI r2, 25
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 177
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
