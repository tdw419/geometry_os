; DESCRIPTION: Draws a blue line from (25, 227) to (486, 242).
; PLAN: r0=25(x1), r1=227(y1), r2=486(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 227
LDI r2, 486
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
