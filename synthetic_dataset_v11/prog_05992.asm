; DESCRIPTION: Draws a white line from (91, 233) to (162, 11).
; PLAN: r0=91(x1), r1=233(y1), r2=162(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 233
LDI r2, 162
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
