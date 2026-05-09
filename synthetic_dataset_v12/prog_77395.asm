; DESCRIPTION: Renders a green line between points (404, 48) and (489, 244).
; PLAN: r0=404(x1), r1=48(y1), r2=489(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 48
LDI r2, 489
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
