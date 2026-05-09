; DESCRIPTION: Renders a blue line between points (371, 104) and (342, 39).
; PLAN: r0=371(x1), r1=104(y1), r2=342(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 104
LDI r2, 342
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
