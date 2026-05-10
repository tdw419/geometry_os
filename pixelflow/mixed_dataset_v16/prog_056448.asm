; DESCRIPTION: Draws a yellow line from (393, 91) to (24, 179).
; PLAN: r0=393(x1), r1=91(y1), r2=24(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 91
LDI r2, 24
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
