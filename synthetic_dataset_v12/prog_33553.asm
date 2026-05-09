; DESCRIPTION: Places a yellow line segment connecting (448, 159) to (487, 95).
; PLAN: r0=448(x1), r1=159(y1), r2=487(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 159
LDI r2, 487
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
