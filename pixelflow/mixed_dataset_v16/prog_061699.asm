; DESCRIPTION: Draws a purple line from (404, 244) to (292, 26).
; PLAN: r0=404(x1), r1=244(y1), r2=292(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 244
LDI r2, 292
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
