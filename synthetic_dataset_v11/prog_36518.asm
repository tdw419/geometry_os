; DESCRIPTION: Draws a blue line from (165, 216) to (173, 84).
; PLAN: r0=165(x1), r1=216(y1), r2=173(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 216
LDI r2, 173
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
