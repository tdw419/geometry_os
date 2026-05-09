; DESCRIPTION: Draws a blue line from (162, 98) to (373, 2).
; PLAN: r0=162(x1), r1=98(y1), r2=373(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 98
LDI r2, 373
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
