; DESCRIPTION: Places a red line segment connecting (350, 177) to (125, 131).
; PLAN: r0=350(x1), r1=177(y1), r2=125(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 177
LDI r2, 125
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
