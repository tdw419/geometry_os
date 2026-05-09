; DESCRIPTION: Renders a blue line between points (419, 64) and (422, 16).
; PLAN: r0=419(x1), r1=64(y1), r2=422(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 64
LDI r2, 422
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
