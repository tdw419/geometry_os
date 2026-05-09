; DESCRIPTION: Draws a blue line from (100, 159) to (106, 55).
; PLAN: r0=100(x1), r1=159(y1), r2=106(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 159
LDI r2, 106
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
