; DESCRIPTION: Draws a blue line from (219, 137) to (242, 97).
; PLAN: r0=219(x1), r1=137(y1), r2=242(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 137
LDI r2, 242
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
