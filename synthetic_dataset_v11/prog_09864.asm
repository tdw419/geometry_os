; DESCRIPTION: Draws a red line from (60, 254) to (249, 155).
; PLAN: r0=60(x1), r1=254(y1), r2=249(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 254
LDI r2, 249
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
