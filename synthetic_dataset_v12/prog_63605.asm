; DESCRIPTION: Composite: Renders a magenta line between points (236, 165) and (471, 236) then Places a purple dot at position (39, 200).
; PLAN: r0=236(x1), r1=165(y1), r2=471(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=200(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 165
LDI r2, 471
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 200
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
