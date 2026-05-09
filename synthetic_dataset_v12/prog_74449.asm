; DESCRIPTION: Draws a red line from (290, 127) to (468, 216).
; PLAN: r0=290(x1), r1=127(y1), r2=468(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 127
LDI r2, 468
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
