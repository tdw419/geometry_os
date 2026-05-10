; DESCRIPTION: Draws a blue line from (174, 162) to (194, 55).
; PLAN: r0=174(x1), r1=162(y1), r2=194(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 162
LDI r2, 194
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
