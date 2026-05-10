; DESCRIPTION: Draws a blue line from (91, 152) to (31, 13).
; PLAN: r0=91(x1), r1=152(y1), r2=31(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 152
LDI r2, 31
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
