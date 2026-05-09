; DESCRIPTION: Draws a black line from (110, 217) to (84, 195).
; PLAN: r0=110(x1), r1=217(y1), r2=84(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 217
LDI r2, 84
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
