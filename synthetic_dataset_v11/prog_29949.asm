; DESCRIPTION: Draws a blue line from (149, 193) to (174, 57).
; PLAN: r0=149(x1), r1=193(y1), r2=174(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 193
LDI r2, 174
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
