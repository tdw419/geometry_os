; DESCRIPTION: Places a red line segment connecting (104, 100) to (170, 197).
; PLAN: r0=104(x1), r1=100(y1), r2=170(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 100
LDI r2, 170
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
