; DESCRIPTION: Draws a red line from (222, 115) to (307, 119).
; PLAN: r0=222(x1), r1=115(y1), r2=307(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 115
LDI r2, 307
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
