; DESCRIPTION: Draws a blue line from (441, 97) to (404, 66).
; PLAN: r0=441(x1), r1=97(y1), r2=404(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 97
LDI r2, 404
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
