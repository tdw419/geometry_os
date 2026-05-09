; DESCRIPTION: Draws a blue line from (236, 241) to (457, 86).
; PLAN: r0=236(x1), r1=241(y1), r2=457(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 241
LDI r2, 457
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
