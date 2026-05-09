; DESCRIPTION: Draws a white line from (231, 48) to (89, 220).
; PLAN: r0=231(x1), r1=48(y1), r2=89(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 48
LDI r2, 89
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
