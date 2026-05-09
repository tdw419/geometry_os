; DESCRIPTION: Draws a black line from (8, 205) to (323, 200).
; PLAN: r0=8(x1), r1=205(y1), r2=323(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 205
LDI r2, 323
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
