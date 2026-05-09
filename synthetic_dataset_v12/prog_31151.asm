; DESCRIPTION: Places a white line segment connecting (478, 150) to (404, 69).
; PLAN: r0=478(x1), r1=150(y1), r2=404(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 150
LDI r2, 404
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
