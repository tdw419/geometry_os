; DESCRIPTION: Draws a black line from (162, 229) to (44, 177).
; PLAN: r0=162(x1), r1=229(y1), r2=44(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 229
LDI r2, 44
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
