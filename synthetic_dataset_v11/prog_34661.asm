; DESCRIPTION: Draws a red line from (117, 133) to (26, 221).
; PLAN: r0=117(x1), r1=133(y1), r2=26(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 133
LDI r2, 26
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
