; DESCRIPTION: Draws a blue line from (20, 78) to (321, 12).
; PLAN: r0=20(x1), r1=78(y1), r2=321(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 78
LDI r2, 321
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
