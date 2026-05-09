; DESCRIPTION: Renders a blue line between points (415, 186) and (400, 201).
; PLAN: r0=415(x1), r1=186(y1), r2=400(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 186
LDI r2, 400
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
