; DESCRIPTION: Draws a black line from (404, 181) to (163, 164).
; PLAN: r0=404(x1), r1=181(y1), r2=163(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 181
LDI r2, 163
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
