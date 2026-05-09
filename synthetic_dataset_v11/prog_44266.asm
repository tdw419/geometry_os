; DESCRIPTION: Draws a blue line from (135, 222) to (251, 204).
; PLAN: r0=135(x1), r1=222(y1), r2=251(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 222
LDI r2, 251
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
