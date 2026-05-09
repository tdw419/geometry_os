; DESCRIPTION: Places a green line segment connecting (51, 251) to (130, 214).
; PLAN: r0=51(x1), r1=251(y1), r2=130(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 251
LDI r2, 130
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
