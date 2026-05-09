; DESCRIPTION: Draws a white line from (231, 31) to (122, 145).
; PLAN: r0=231(x1), r1=31(y1), r2=122(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 31
LDI r2, 122
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
