; DESCRIPTION: Draws a red line from (229, 13) to (121, 205).
; PLAN: r0=229(x1), r1=13(y1), r2=121(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 13
LDI r2, 121
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
