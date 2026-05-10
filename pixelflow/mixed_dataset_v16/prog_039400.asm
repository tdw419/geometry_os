; DESCRIPTION: Draws a blue line from (153, 149) to (0, 152).
; PLAN: r0=153(x1), r1=149(y1), r2=0(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 149
LDI r2, 0
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
