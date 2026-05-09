; DESCRIPTION: Draws a red line from (26, 186) to (226, 186).
; PLAN: r0=26(x1), r1=186(y1), r2=226(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 186
LDI r2, 226
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
