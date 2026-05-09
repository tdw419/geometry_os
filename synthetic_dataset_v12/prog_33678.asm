; DESCRIPTION: Draws a black line from (279, 63) to (369, 119).
; PLAN: r0=279(x1), r1=63(y1), r2=369(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 63
LDI r2, 369
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
