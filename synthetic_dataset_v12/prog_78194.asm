; DESCRIPTION: Draws a green line from (132, 201) to (438, 151).
; PLAN: r0=132(x1), r1=201(y1), r2=438(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 201
LDI r2, 438
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
