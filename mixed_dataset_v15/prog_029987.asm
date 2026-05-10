; DESCRIPTION: Renders a red line between points (404, 64) and (349, 221).
; PLAN: r0=404(x1), r1=64(y1), r2=349(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 64
LDI r2, 349
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
