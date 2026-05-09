; DESCRIPTION: Draws a red line from (103, 254) to (162, 217).
; PLAN: r0=103(x1), r1=254(y1), r2=162(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 254
LDI r2, 162
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
