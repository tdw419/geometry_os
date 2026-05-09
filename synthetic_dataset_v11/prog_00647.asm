; DESCRIPTION: Draws a red line from (250, 231) to (74, 26).
; PLAN: r0=250(x1), r1=231(y1), r2=74(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 231
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
