; DESCRIPTION: Draws a white line from (162, 211) to (432, 249).
; PLAN: r0=162(x1), r1=211(y1), r2=432(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 211
LDI r2, 432
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
