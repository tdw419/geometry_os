; DESCRIPTION: Draws a red line from (143, 231) to (413, 17).
; PLAN: r0=143(x1), r1=231(y1), r2=413(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 231
LDI r2, 413
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
