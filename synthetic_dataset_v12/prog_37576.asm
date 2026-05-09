; DESCRIPTION: Renders a blue line between points (275, 23) and (400, 131).
; PLAN: r0=275(x1), r1=23(y1), r2=400(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 23
LDI r2, 400
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
