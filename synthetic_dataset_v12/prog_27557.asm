; DESCRIPTION: Places a blue line segment connecting (435, 173) to (422, 130).
; PLAN: r0=435(x1), r1=173(y1), r2=422(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 173
LDI r2, 422
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
