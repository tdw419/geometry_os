; DESCRIPTION: Composite: Draws a red line from (142, 146) to (209, 31) then Sets a single purple pixel at (191, 165).
; PLAN: r0=142(x1), r1=146(y1), r2=209(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=165(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 146
LDI r2, 209
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 165
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
