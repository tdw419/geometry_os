; DESCRIPTION: Draws a blue line from (20, 60) to (31, 11).
; PLAN: r0=20(x1), r1=60(y1), r2=31(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 60
LDI r2, 31
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
