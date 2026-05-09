; DESCRIPTION: Places a red line segment connecting (220, 248) to (208, 51).
; PLAN: r0=220(x1), r1=248(y1), r2=208(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 248
LDI r2, 208
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
