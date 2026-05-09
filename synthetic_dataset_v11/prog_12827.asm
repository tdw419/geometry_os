; DESCRIPTION: Draws a red line from (13, 250) to (179, 68).
; PLAN: r0=13(x1), r1=250(y1), r2=179(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 250
LDI r2, 179
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
