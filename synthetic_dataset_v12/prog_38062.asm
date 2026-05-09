; DESCRIPTION: Draws a red line from (434, 112) to (489, 222).
; PLAN: r0=434(x1), r1=112(y1), r2=489(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 112
LDI r2, 489
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
