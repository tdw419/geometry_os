; DESCRIPTION: Places a red line segment connecting (404, 148) to (1, 178).
; PLAN: r0=404(x1), r1=148(y1), r2=1(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 148
LDI r2, 1
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
