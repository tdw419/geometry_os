; DESCRIPTION: Draws a blue line from (125, 149) to (364, 72).
; PLAN: r0=125(x1), r1=149(y1), r2=364(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 149
LDI r2, 364
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
