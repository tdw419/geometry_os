; DESCRIPTION: Renders a black line between points (71, 220) and (404, 50).
; PLAN: r0=71(x1), r1=220(y1), r2=404(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 220
LDI r2, 404
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
