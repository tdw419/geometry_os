; DESCRIPTION: Draws a blue line from (16, 90) to (141, 89).
; PLAN: r0=16(x1), r1=90(y1), r2=141(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 90
LDI r2, 141
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
