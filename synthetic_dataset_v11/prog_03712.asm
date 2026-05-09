; DESCRIPTION: Draws a red line from (177, 138) to (143, 211).
; PLAN: r0=177(x1), r1=138(y1), r2=143(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 138
LDI r2, 143
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
