; DESCRIPTION: Composite: Renders a orange line between points (231, 119) and (118, 218) then Places a cyan dot at position (106, 174).
; PLAN: r0=231(x1), r1=119(y1), r2=118(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=174(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 231
LDI r1, 119
LDI r2, 118
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 174
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
