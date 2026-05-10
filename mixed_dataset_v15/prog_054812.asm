; DESCRIPTION: Draws a blue line from (234, 84) to (404, 120).
; PLAN: r0=234(x1), r1=84(y1), r2=404(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 84
LDI r2, 404
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
