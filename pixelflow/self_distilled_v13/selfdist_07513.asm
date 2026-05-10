; DESCRIPTION: Draws a blue line from (393, 132) to (223, 39).
; PLAN: r0=393(x1), r1=132(y1), r2=223(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 132
LDI r2, 223
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
