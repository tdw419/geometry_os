; DESCRIPTION: Draws a blue line from (180, 152) to (133, 35).
; PLAN: r0=180(x1), r1=152(y1), r2=133(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 152
LDI r2, 133
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
