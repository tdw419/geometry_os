; DESCRIPTION: Composite: Draws a purple line from (486, 111) to (253, 186) then Places a red dot at position (95, 97).
; PLAN: r0=486(x1), r1=111(y1), r2=253(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=97(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 486
LDI r1, 111
LDI r2, 253
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 97
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
