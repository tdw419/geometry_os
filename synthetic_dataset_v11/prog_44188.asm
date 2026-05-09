; DESCRIPTION: Draws a blue line from (144, 87) to (58, 51).
; PLAN: r0=144(x1), r1=87(y1), r2=58(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 87
LDI r2, 58
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
