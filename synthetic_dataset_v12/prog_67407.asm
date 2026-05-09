; DESCRIPTION: Renders a purple line between points (186, 173) and (404, 216).
; PLAN: r0=186(x1), r1=173(y1), r2=404(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 173
LDI r2, 404
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
