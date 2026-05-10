; DESCRIPTION: Draws a red line from (411, 208) to (145, 222).
; PLAN: r0=411(x1), r1=208(y1), r2=145(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 208
LDI r2, 145
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
