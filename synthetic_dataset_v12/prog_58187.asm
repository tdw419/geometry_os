; DESCRIPTION: Places a red line segment connecting (260, 178) to (272, 216).
; PLAN: r0=260(x1), r1=178(y1), r2=272(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 178
LDI r2, 272
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
