; DESCRIPTION: Places a purple line segment connecting (436, 124) to (174, 143).
; PLAN: r0=436(x1), r1=124(y1), r2=174(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 124
LDI r2, 174
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
