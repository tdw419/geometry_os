; DESCRIPTION: Places a purple line segment connecting (174, 124) to (230, 178).
; PLAN: r0=174(x1), r1=124(y1), r2=230(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 124
LDI r2, 230
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
