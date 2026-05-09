; DESCRIPTION: Draws a blue line from (154, 1) to (110, 78).
; PLAN: r0=154(x1), r1=1(y1), r2=110(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 1
LDI r2, 110
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
