; DESCRIPTION: Places a red line segment connecting (264, 233) to (439, 217).
; PLAN: r0=264(x1), r1=233(y1), r2=439(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 233
LDI r2, 439
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
