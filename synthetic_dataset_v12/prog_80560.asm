; DESCRIPTION: Places a white line segment connecting (404, 70) to (80, 221).
; PLAN: r0=404(x1), r1=70(y1), r2=80(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 70
LDI r2, 80
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
