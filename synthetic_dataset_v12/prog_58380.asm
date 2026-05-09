; DESCRIPTION: Composite: Draws a red line from (127, 4) to (203, 226) then Sets a single white pixel at (204, 63).
; PLAN: r0=127(x1), r1=4(y1), r2=203(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 4
LDI r2, 203
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
