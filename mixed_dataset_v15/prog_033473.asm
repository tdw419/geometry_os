; DESCRIPTION: Draws a blue line from (137, 154) to (319, 96).
; PLAN: r0=137(x1), r1=154(y1), r2=319(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 154
LDI r2, 319
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
