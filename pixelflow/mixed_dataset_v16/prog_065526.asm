; DESCRIPTION: Composite: Draws a purple line from (149, 18) to (172, 204) then Places a magenta dot at position (486, 193).
; PLAN: r0=149(x1), r1=18(y1), r2=172(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=193(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 18
LDI r2, 172
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 193
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
