; DESCRIPTION: Draws a red line from (225, 208) to (486, 135).
; PLAN: r0=225(x1), r1=208(y1), r2=486(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 208
LDI r2, 486
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
