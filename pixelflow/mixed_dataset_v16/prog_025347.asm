; DESCRIPTION: Draws a blue line from (496, 84) to (404, 156).
; PLAN: r0=496(x1), r1=84(y1), r2=404(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 84
LDI r2, 404
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
