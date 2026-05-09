; DESCRIPTION: Draws a green line from (438, 137) to (29, 22).
; PLAN: r0=438(x1), r1=137(y1), r2=29(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 137
LDI r2, 29
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
