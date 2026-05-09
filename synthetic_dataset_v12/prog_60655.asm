; DESCRIPTION: Draws a black line from (399, 125) to (231, 70).
; PLAN: r0=399(x1), r1=125(y1), r2=231(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 125
LDI r2, 231
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
