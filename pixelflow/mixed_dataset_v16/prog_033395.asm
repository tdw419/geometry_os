; DESCRIPTION: Draws a blue line from (178, 226) to (321, 110).
; PLAN: r0=178(x1), r1=226(y1), r2=321(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 226
LDI r2, 321
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
