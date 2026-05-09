; DESCRIPTION: Renders a yellow line between points (412, 47) and (404, 206).
; PLAN: r0=412(x1), r1=47(y1), r2=404(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 47
LDI r2, 404
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
