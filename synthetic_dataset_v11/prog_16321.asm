; DESCRIPTION: Places a yellow line segment connecting (80, 134) to (51, 20).
; PLAN: r0=80(x1), r1=134(y1), r2=51(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 134
LDI r2, 51
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
