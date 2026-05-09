; DESCRIPTION: Draws a blue line from (130, 154) to (221, 152).
; PLAN: r0=130(x1), r1=154(y1), r2=221(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 221
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
