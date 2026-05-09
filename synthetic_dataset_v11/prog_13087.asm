; DESCRIPTION: Draws a blue line from (122, 102) to (196, 130).
; PLAN: r0=122(x1), r1=102(y1), r2=196(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 102
LDI r2, 196
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
