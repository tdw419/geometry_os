; DESCRIPTION: Draws a green line from (202, 89) to (236, 137).
; PLAN: r0=202(x1), r1=89(y1), r2=236(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 89
LDI r2, 236
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
