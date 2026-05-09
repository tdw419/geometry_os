; DESCRIPTION: Draws a blue line from (100, 39) to (225, 99).
; PLAN: r0=100(x1), r1=39(y1), r2=225(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 39
LDI r2, 225
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
