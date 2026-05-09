; DESCRIPTION: Renders a blue line between points (218, 124) and (225, 207).
; PLAN: r0=218(x1), r1=124(y1), r2=225(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 124
LDI r2, 225
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
