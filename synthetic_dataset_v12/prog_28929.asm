; DESCRIPTION: Draws a green line from (404, 169) to (59, 248).
; PLAN: r0=404(x1), r1=169(y1), r2=59(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 169
LDI r2, 59
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
