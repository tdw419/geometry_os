; DESCRIPTION: Draws a blue line from (20, 66) to (253, 229).
; PLAN: r0=20(x1), r1=66(y1), r2=253(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 66
LDI r2, 253
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
