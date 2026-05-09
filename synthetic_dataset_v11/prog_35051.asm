; DESCRIPTION: Draws a red line from (186, 83) to (144, 207).
; PLAN: r0=186(x1), r1=83(y1), r2=144(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 83
LDI r2, 144
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
