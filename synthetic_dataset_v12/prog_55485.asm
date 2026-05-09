; DESCRIPTION: Places a blue line segment connecting (273, 225) to (373, 83).
; PLAN: r0=273(x1), r1=225(y1), r2=373(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 225
LDI r2, 373
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
