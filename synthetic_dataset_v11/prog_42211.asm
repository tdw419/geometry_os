; DESCRIPTION: Draws a blue line from (130, 54) to (186, 55).
; PLAN: r0=130(x1), r1=54(y1), r2=186(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 54
LDI r2, 186
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
