; DESCRIPTION: Places a purple line segment connecting (404, 167) to (305, 146).
; PLAN: r0=404(x1), r1=167(y1), r2=305(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 167
LDI r2, 305
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
