; DESCRIPTION: Draws a blue line from (150, 140) to (404, 95).
; PLAN: r0=150(x1), r1=140(y1), r2=404(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 140
LDI r2, 404
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
