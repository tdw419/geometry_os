; DESCRIPTION: Draws a blue line from (420, 33) to (260, 74).
; PLAN: r0=420(x1), r1=33(y1), r2=260(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 33
LDI r2, 260
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
