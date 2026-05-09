; DESCRIPTION: Places a white line segment connecting (110, 230) to (246, 233).
; PLAN: r0=110(x1), r1=230(y1), r2=246(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 230
LDI r2, 246
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
