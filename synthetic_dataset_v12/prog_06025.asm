; DESCRIPTION: Draws a green line from (419, 252) to (245, 200).
; PLAN: r0=419(x1), r1=252(y1), r2=245(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 252
LDI r2, 245
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
