; DESCRIPTION: Draws a blue line from (24, 176) to (135, 152).
; PLAN: r0=24(x1), r1=176(y1), r2=135(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 176
LDI r2, 135
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
