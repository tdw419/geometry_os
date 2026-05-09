; DESCRIPTION: Places a red line segment connecting (261, 89) to (209, 142).
; PLAN: r0=261(x1), r1=89(y1), r2=209(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 89
LDI r2, 209
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
