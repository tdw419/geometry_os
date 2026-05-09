; DESCRIPTION: Draws a red line from (220, 225) to (250, 162).
; PLAN: r0=220(x1), r1=225(y1), r2=250(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 225
LDI r2, 250
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
