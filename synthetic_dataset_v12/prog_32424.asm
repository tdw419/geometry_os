; DESCRIPTION: Draws a magenta line from (24, 17) to (404, 14).
; PLAN: r0=24(x1), r1=17(y1), r2=404(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 17
LDI r2, 404
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
