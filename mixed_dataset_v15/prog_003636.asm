; DESCRIPTION: Draws a blue line from (152, 152) to (156, 94).
; PLAN: r0=152(x1), r1=152(y1), r2=156(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 152
LDI r2, 156
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
