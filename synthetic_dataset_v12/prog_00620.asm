; DESCRIPTION: Draws a green line from (219, 226) to (37, 185).
; PLAN: r0=219(x1), r1=226(y1), r2=37(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 226
LDI r2, 37
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
