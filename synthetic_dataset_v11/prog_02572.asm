; DESCRIPTION: Draws a green line from (236, 162) to (179, 232).
; PLAN: r0=236(x1), r1=162(y1), r2=179(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 162
LDI r2, 179
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
