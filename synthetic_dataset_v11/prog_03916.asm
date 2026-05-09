; DESCRIPTION: Places a purple line segment connecting (174, 247) to (210, 155).
; PLAN: r0=174(x1), r1=247(y1), r2=210(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 247
LDI r2, 210
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
