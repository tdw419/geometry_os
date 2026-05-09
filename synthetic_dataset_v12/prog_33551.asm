; DESCRIPTION: Draws a yellow line from (153, 150) to (404, 129).
; PLAN: r0=153(x1), r1=150(y1), r2=404(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 150
LDI r2, 404
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
