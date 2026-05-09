; DESCRIPTION: Places a red line segment connecting (404, 165) to (4, 194).
; PLAN: r0=404(x1), r1=165(y1), r2=4(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 165
LDI r2, 4
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
