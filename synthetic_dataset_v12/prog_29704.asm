; DESCRIPTION: Draws a blue line from (152, 84) to (46, 8).
; PLAN: r0=152(x1), r1=84(y1), r2=46(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 84
LDI r2, 46
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
