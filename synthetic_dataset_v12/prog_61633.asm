; DESCRIPTION: Draws a black line from (120, 77) to (162, 233).
; PLAN: r0=120(x1), r1=77(y1), r2=162(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 77
LDI r2, 162
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
