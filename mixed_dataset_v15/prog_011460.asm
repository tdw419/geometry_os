; DESCRIPTION: Draws a green line from (290, 89) to (418, 142).
; PLAN: r0=290(x1), r1=89(y1), r2=418(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 89
LDI r2, 418
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
