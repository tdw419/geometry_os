; DESCRIPTION: Draws a black line from (153, 91) to (195, 179).
; PLAN: r0=153(x1), r1=91(y1), r2=195(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 91
LDI r2, 195
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
