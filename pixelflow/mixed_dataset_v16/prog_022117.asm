; DESCRIPTION: Draws a orange line from (345, 162) to (202, 233).
; PLAN: r0=345(x1), r1=162(y1), r2=202(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 162
LDI r2, 202
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
