; DESCRIPTION: Places a red line segment connecting (143, 200) to (277, 86).
; PLAN: r0=143(x1), r1=200(y1), r2=277(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 200
LDI r2, 277
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
