; DESCRIPTION: Draws a white line from (390, 137) to (87, 31).
; PLAN: r0=390(x1), r1=137(y1), r2=87(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 137
LDI r2, 87
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
