; DESCRIPTION: Draws a white line from (411, 12) to (331, 58).
; PLAN: r0=411(x1), r1=12(y1), r2=331(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 12
LDI r2, 331
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
