; DESCRIPTION: Draws a yellow line from (149, 229) to (162, 126).
; PLAN: r0=149(x1), r1=229(y1), r2=162(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 229
LDI r2, 162
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
