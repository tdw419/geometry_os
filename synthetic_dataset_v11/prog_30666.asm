; DESCRIPTION: Draws a green line from (179, 25) to (176, 149).
; PLAN: r0=179(x1), r1=25(y1), r2=176(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 25
LDI r2, 176
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
