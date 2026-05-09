; DESCRIPTION: Renders a green line between points (174, 152) and (404, 80).
; PLAN: r0=174(x1), r1=152(y1), r2=404(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 152
LDI r2, 404
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
