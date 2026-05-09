; DESCRIPTION: Places a red line segment connecting (218, 182) to (178, 220).
; PLAN: r0=218(x1), r1=182(y1), r2=178(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 182
LDI r2, 178
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
