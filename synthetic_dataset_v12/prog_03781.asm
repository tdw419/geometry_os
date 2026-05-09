; DESCRIPTION: Draws a red line from (92, 208) to (232, 180).
; PLAN: r0=92(x1), r1=208(y1), r2=232(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 208
LDI r2, 232
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
