; DESCRIPTION: Draws a red line from (186, 214) to (162, 26).
; PLAN: r0=186(x1), r1=214(y1), r2=162(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 214
LDI r2, 162
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
