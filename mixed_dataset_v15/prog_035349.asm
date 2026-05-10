; DESCRIPTION: Composite: Draws a red line from (141, 132) to (179, 49) then Places a blue dot at position (61, 246).
; PLAN: r0=141(x1), r1=132(y1), r2=179(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=246(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 132
LDI r2, 179
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 246
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
