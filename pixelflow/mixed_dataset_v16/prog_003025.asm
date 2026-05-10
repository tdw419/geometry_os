; DESCRIPTION: Draws a green line from (75, 45) to (351, 229).
; PLAN: r0=75(x1), r1=45(y1), r2=351(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 45
LDI r2, 351
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
