; DESCRIPTION: Places a green line segment connecting (282, 177) to (484, 7).
; PLAN: r0=282(x1), r1=177(y1), r2=484(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 177
LDI r2, 484
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
