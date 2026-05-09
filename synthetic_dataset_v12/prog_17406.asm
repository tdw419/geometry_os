; DESCRIPTION: Places a red line segment connecting (297, 159) to (422, 134).
; PLAN: r0=297(x1), r1=159(y1), r2=422(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 159
LDI r2, 422
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
