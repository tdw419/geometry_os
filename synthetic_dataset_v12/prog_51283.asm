; DESCRIPTION: Draws a black line from (411, 162) to (229, 76).
; PLAN: r0=411(x1), r1=162(y1), r2=229(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 162
LDI r2, 229
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
