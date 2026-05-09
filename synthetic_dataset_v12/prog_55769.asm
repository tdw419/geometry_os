; DESCRIPTION: Places a black line segment connecting (241, 146) to (428, 104).
; PLAN: r0=241(x1), r1=146(y1), r2=428(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 146
LDI r2, 428
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
