; DESCRIPTION: Draws a yellow line from (292, 133) to (286, 150).
; PLAN: r0=292(x1), r1=133(y1), r2=286(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 133
LDI r2, 286
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
