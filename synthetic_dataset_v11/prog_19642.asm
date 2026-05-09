; DESCRIPTION: Draws a red line from (186, 104) to (177, 139).
; PLAN: r0=186(x1), r1=104(y1), r2=177(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 104
LDI r2, 177
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
