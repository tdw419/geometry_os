; DESCRIPTION: Draws a black line from (270, 118) to (392, 133).
; PLAN: r0=270(x1), r1=118(y1), r2=392(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 118
LDI r2, 392
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
