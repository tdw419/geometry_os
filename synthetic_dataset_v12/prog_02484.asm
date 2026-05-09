; DESCRIPTION: Draws a red line from (153, 162) to (53, 251).
; PLAN: r0=153(x1), r1=162(y1), r2=53(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 162
LDI r2, 53
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
