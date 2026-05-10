; DESCRIPTION: Composite: Draws a red line from (370, 138) to (182, 235) then Places a purple dot at position (327, 147).
; PLAN: r0=370(x1), r1=138(y1), r2=182(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=147(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 370
LDI r1, 138
LDI r2, 182
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 147
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
