; DESCRIPTION: Composite: Draws a purple line from (158, 131) to (31, 93) then Places a yellow dot at position (180, 168).
; PLAN: r0=158(x1), r1=131(y1), r2=31(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=168(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 158
LDI r1, 131
LDI r2, 31
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 168
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
