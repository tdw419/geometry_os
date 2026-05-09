; DESCRIPTION: Renders a blue line between points (467, 204) and (404, 95).
; PLAN: r0=467(x1), r1=204(y1), r2=404(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 204
LDI r2, 404
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
