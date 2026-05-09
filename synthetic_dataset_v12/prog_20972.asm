; DESCRIPTION: Draws a red line from (11, 3) to (404, 237).
; PLAN: r0=11(x1), r1=3(y1), r2=404(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 404
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
