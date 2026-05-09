; DESCRIPTION: Draws a blue line from (11, 15) to (196, 15).
; PLAN: r0=11(x1), r1=15(y1), r2=196(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 15
LDI r2, 196
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
