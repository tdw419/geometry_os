; DESCRIPTION: Draws a blue line from (266, 98) to (387, 100).
; PLAN: r0=266(x1), r1=98(y1), r2=387(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 98
LDI r2, 387
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
