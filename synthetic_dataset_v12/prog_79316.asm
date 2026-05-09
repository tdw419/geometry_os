; DESCRIPTION: Composite: Draws a magenta line from (26, 39) to (95, 47) then Sets a single white pixel at (180, 118).
; PLAN: r0=26(x1), r1=39(y1), r2=95(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=118(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 39
LDI r2, 95
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 118
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
