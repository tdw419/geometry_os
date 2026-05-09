; DESCRIPTION: Renders a blue line between points (404, 172) and (458, 52).
; PLAN: r0=404(x1), r1=172(y1), r2=458(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 172
LDI r2, 458
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
