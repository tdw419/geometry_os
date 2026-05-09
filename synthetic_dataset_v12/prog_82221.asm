; DESCRIPTION: Places a red line segment connecting (261, 190) to (277, 98).
; PLAN: r0=261(x1), r1=190(y1), r2=277(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 190
LDI r2, 277
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
