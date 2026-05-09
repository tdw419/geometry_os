; DESCRIPTION: Composite: Draws a purple line from (20, 43) to (394, 226) then Sets a single white pixel at (167, 90).
; PLAN: r0=20(x1), r1=43(y1), r2=394(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=90(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 20
LDI r1, 43
LDI r2, 394
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 90
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
