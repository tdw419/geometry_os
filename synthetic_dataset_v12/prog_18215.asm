; DESCRIPTION: Draws a blue line from (260, 204) to (345, 196).
; PLAN: r0=260(x1), r1=204(y1), r2=345(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 204
LDI r2, 345
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
