; DESCRIPTION: Renders a purple line between points (404, 172) and (108, 117).
; PLAN: r0=404(x1), r1=172(y1), r2=108(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 172
LDI r2, 108
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
