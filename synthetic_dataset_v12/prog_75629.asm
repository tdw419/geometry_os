; DESCRIPTION: Places a red line segment connecting (144, 104) to (195, 51).
; PLAN: r0=144(x1), r1=104(y1), r2=195(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 104
LDI r2, 195
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
