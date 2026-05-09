; DESCRIPTION: Draws a blue line from (205, 189) to (144, 84).
; PLAN: r0=205(x1), r1=189(y1), r2=144(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 189
LDI r2, 144
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
