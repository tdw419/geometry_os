; DESCRIPTION: Draws a green line from (251, 79) to (185, 219).
; PLAN: r0=251(x1), r1=79(y1), r2=185(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 79
LDI r2, 185
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
