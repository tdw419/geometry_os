; DESCRIPTION: Draws a blue line from (459, 46) to (110, 93).
; PLAN: r0=459(x1), r1=46(y1), r2=110(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 46
LDI r2, 110
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
