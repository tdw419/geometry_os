; DESCRIPTION: Draws a blue line from (506, 144) to (277, 139).
; PLAN: r0=506(x1), r1=144(y1), r2=277(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 144
LDI r2, 277
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
